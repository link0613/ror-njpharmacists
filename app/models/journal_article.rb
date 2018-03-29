class JournalArticle < ActiveRecord::Base
  validates_presence_of :name, :phone, :email, :abstract
end
