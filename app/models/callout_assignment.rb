class CalloutAssignment < ActiveRecord::Base
	belongs_to :page
	belongs_to :callout
	default_scope { order(:order_num) }
end