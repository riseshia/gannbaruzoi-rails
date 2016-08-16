json.extract! task, :id, :description, :estimated_pomodoro, :done_flg, :parent_task_id, :user_id, :created_at, :updated_at
json.url task_url(task, format: :json)