class PusherTaskListener
  def initialize(socket_id, quene=QC, worker=PushWorker)
    @socket_id = socket_id
    @worker = worker
    @queue = queue
  end
  def on_create(task) 
    push_task(task, 'create_task')
    push_project_update(@task.project.id) if @task.project
  end
  def on_project_change(task, previous_project_id, new_project_id)
    push_project_update(previous_project_id) if previous_project_id
    push_project_update(new_project_id) if new_project_id
  end

  def on_assignment_change(task, previous_assignee,new_assignee)
    push_task('create_task', new_assignee) if new_assignee
    push_task('delete_task', previous_assignee) if previous_assignee
  end

  def on_update(task, new_assignee)
    update_users = task.reader -[new_assignee] if task.project
    push_task('update_task', update_users)
  end
end
