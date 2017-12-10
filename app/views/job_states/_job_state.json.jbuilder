json.extract! job_state, :id, :step_number, :name, :status, :created_at, :updated_at
json.url job_state_url(job_state, format: :json)
