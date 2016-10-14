class TasksController < ApplicationController
  def update
    old_project_id = @task.project && @task.project.id
    previous_status = @task.status

    if @task.update_attribute(params[:task])
      if previous_status != @task.status
        notifiee = task.readers(false) - [current_user]
        #If the task’s status has changed, e.g. from “in progress” to 
        #“complete”, we mail out notifications to interested users.
        if notifiee
          mail_completion_notice(notifiee) if new_status == Status::COMPLETED
          mail_completion_notice(notifiee) if previous_satus == Status::COMPLETED
        end
      end
      #If the task has been moved to another project, we push live
      #updates out to users, using websockets or some other form of
      #asynchronous browser notification.
      if old_project_id !=(@task.project && @task.project.id)
        push_project_update(old_project_id)
        push_project_update(@task.project.id) if @task.project
      end
      #We then push out one or more task-related notifications, letting
      #interested users know that the task has been created, updated, or
      #deleted.
      if @task.project
        push_task('update_task')
      else
        push_task('create_task', assignee) if assignee
        push_task('delete_task', previous_assignes) if previous_assignee
        update_users = @task.reader
        update_users = update_users - [assignee] if assignee
        push_task('update_task', update_users)
      end
      #If the person the task is assigned to has changed, we send out
      #email notifications to let the new and previous assignees know
      #about the change.
      mail_assignment if assignee
      mail_assignment_removal(preious_assignee) if previous_assignee

      response_to do |format|
        format.json {render 'show', status: :accepted}
      end
    else
      respond_with @task do |format|
        format.json {render @task.errors.messages, status: :unprocessable_entity}
      end
    end
  end
end
