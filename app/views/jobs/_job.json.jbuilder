json.extract! job, :id, :name, :description, :category, :expiration_date, :user_id, :created_at, :updated_at
json.url job_url(job, format: :json)