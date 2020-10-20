class AddAttachmentToJobAplication < ActiveRecord::Migration[6.0]
  def change
    add_column :job_aplications, :attachment, :string
  end
end
