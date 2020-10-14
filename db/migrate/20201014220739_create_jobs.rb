class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :name
      t.text :description
      t.string :category
      t.datetime :expiration_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
