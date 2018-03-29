class Ckeditor::AttachmentFile < Ckeditor::Asset
  has_attached_file :data,
                    url: "#{Rails.application.secrets.host_name}/ckeditor_assets/attachments/:id/:filename",
                    path: "#{Rails.root}/public/ckeditor_assets/attachments/:id/:filename" 

  do_not_validate_attachment_file_type :data
  
  validates_attachment_size :data, less_than: 100.megabytes
  validates_attachment_presence :data
  
  before_post_process :is_image?
  
  def is_image?
    ["image/jpeg", "image/pjpeg", "image/png", "image/x-png", "image/gif"].include?(self.data_content_type)
  end

  def url_thumb
    @url_thumb ||= Ckeditor::Utils.filethumb(filename)
  end
end
