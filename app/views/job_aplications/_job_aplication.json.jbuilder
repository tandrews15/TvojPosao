json.extract! job_aplication, :id, :name, :date_of_birth, :email, :phone_num, :adress, :education, :job_id, :created_at, :updated_at
json.url job_aplication_url(job_aplication, format: :json)
