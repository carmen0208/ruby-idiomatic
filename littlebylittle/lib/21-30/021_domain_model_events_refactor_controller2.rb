class TasksController < ApplicationController
  def update
#    @task.add_listener self
    @task.add_listener PusherTaskListener(@socket_id)
    @task.add_listener TaskEmailListener.new(current_user)
    if @task.update_attribute(params[:task])
      response_to do |format|
        format.json {render 'show', status: :accepted}
      end
    else
      respond_with @task do |format|
        format.json {render @task.errors.messages, status: :unprocessable_entity}
      end
    end
  end

  # def on_create(task)
  #   push_task('create_task')
  #   push_project_update(@task.project.id) if @task.project
  #   mail_assignment if @assignee && @assignee != current_user
  # end
  # def on_project_change(task, previous_project_id, new_project_id)
  #   push_project_update(previous_project_id)
  #   push_project_update(new_project_id) if new_project_id
  # end
  # def on_status_change(task, previous_status, new_status)
  #   notifiee = task.reader(false) - [current_user]
  #   if notifiee
  #     mail_completion_notice(notifiee) if new_status == Stutus::COMPLETED
  #     mail_uncomplete_notice(notifiee) if previous_status == Status::COMPLETED
  #   end
  # end
  #
  # def on_assignment_change(task, previous_assignee,new_assignee)
  #   push_task('create_task', new_assignee) if new_assignee
  #   mail_assignment if new_assignee
  #
  #   push_task('delete_task', previous_assignee) if previous_assignee
  #   mail_assignment_removal(previous_assignee) if previous_assignee
  # end
  #
  # def on_update(task, new_assignee)
  #   update_users = task.reader -[new_assignee] if task.project
  #   push_task('update_task', update_users)
  #
  # end
end
