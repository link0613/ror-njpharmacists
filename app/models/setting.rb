class Setting < ActiveRecord::Base
  has_attached_file :setting_attachment,
                  :url  => "#{Rails.application.secrets.host_name}/settings/attachment/:id/:style_:basename.:extension",
                  path: "#{Rails.root}/public/settings/attachment/:id/:style_:basename.:extension"

  do_not_validate_attachment_file_type :setting_attachment
                  
  default_scope {order(:id)}
  
end
