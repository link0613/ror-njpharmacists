class ProposelDocument < ActiveRecord::Base
	has_attached_file :document, 
	:url  => "#{Rails.application.secrets.host_name}/supporting_material/proposel_document/:id/:style_:basename.:extension",
	path: "#{Rails.root}/public/supporting_material/proposel_document/:id/:style_:basename.:extension"

	do_not_validate_attachment_file_type :document
	belongs_to :faculty_propsel
end
