class Blog < ActiveRecord::Base
  has_many :blog_posts
  
  validates_uniqueness_of :blog_title
  validates_uniqueness_of :blog_url_alias
  
  before_save :create_url_alias
  
  def create_url_alias
    encoding_options = {
      :invalid           => :replace,  # Replace invalid byte sequences
      :undef             => :replace,  # Replace anything not defined in ASCII
      :replace           => '',        # Use a blank for those replacements
    }
    url_alias = ActionView::Base.full_sanitizer.sanitize(self.blog_title, tags: []).encode(Encoding.find('ASCII'), encoding_options).downcase.gsub(':','-').gsub(' ','-').gsub('--','-').gsub('.','').gsub('/','').gsub(',','').truncate(50, separator: ' ', omission: '')
    self.blog_url_alias = url_alias
  end
  
  def build_homepage_title
    title_components = self.blog_title.split(' ')
    return_val = "<h4 style='text-transform:uppercase;'><span class='red-text'>#{title_components[0]}</span> "
    title_components.shift
    return_val += "#{title_components.join(' ')}</h4>"
    return return_val
  end
  
end
