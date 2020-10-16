class CreateJobAplications < ActiveRecord::Migration[6.0]
  def change
    create_table :job_aplications do |t|
      t.string :name
      t.datetime :date_of_birth
      t.string :email
      t.string :phone_num
      t.string :address
      t.string :education
      t.references :job, null: false, foreign_key: true

      t.timestamps
    end
  end
end
