class AwardNomination < ActiveRecord::Base
	has_attached_file :supporting_material,
                  :url  => "#{Rails.application.secrets.host_name}/supporting_material/attachment/:id/:style_:basename.:extension",
                  path: "#{Rails.root}/public/supporting_material/attachment/:id/:style_:basename.:extension"

	validates_presence_of :award_name, :nominator_name, :nominator_email, :nominee_name, :nominee_email, :nominee_phone, :reason_for_nomination
	#validates_attachment_presence :supporting_material

  do_not_validate_attachment_file_type :supporting_material

end
