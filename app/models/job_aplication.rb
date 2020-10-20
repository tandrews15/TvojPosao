class JobAplication < ApplicationRecord
  belongs_to :job

  validates :phone_num, presence: true,
                        numericality: true,
                        length: { :minimum => 6, :maximum => 15 }

  validates :email, presence: true,
                    format: { with: Devise.email_regexp }

  validates :email, :date_of_birth, :email, :address, :education, :job_id, presence: true


  validates_uniqueness_of :job_id, scope: [:user_id]


  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.  

end
