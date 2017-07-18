class Resume < ApplicationRecord
  validates :content ,presence: true
 belongs_to :job
 belongs_to :user
 mount_uploader :attachment, AttachmentUploader

 scope :recent, ->{order('created_at DESC')}
end
