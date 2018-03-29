class MemberMomentum < ActiveRecord::Base
  validates_presence_of :name, :about_recognition, :momentum_date,:email
  has_attached_file :member_attachment,
                  :url  => "#{Rails.application.secrets.host_name}/member_momentums/attachment/:id/:style_:basename.:extension",
                  path: "#{Rails.root}/public/member_momentums/attachment/:id/:style_:basename.:extension"

  do_not_validate_attachment_file_type :member_attachment
end
