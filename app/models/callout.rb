class Callout < ActiveRecord::Base
	has_many :callout_assignments, :dependent => :destroy
 	has_many :pages, through: :callout_assignments

	default_scope {order(:callout_title)}
end
