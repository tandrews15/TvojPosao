class AddConstraintToJobAplications < ActiveRecord::Migration[6.0]
  def change
    add_index :job_aplications, [:user_id, :job_id], unique: true
  end
end
