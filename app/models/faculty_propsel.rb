class FacultyPropsel < ActiveRecord::Base
	validates_presence_of :name, :address, :city, :state, :zip, :program_title, :office_phone, :program_title, :program_length,:activity_based,:brief_summary
	has_many :proposel_documents
	accepts_nested_attributes_for :proposel_documents ,:allow_destroy => true
end
