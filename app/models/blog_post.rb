class BlogPost < ActiveRecord::Base
  belongs_to :blog
  
  has_attached_file :featured_image,
                :url  => "/blog_posts/featured_image/:id/:style_:basename.:extension",
                path: "blog_posts/featured_image/:id/:style_:basename.:extension"
  
  before_save :create_url_alias

  default_scope { order('created_at desc') }
  
  self.per_page = 5
  
  def create_url_alias
    if(self.post_title.nil?)
      return
    end
    encoding_options = {
      :invalid           => :replace,  # Replace invalid byte sequences
      :undef             => :replace,  # Replace anything not defined in ASCII
      :replace           => '',        # Use a blank for those replacements
    }
    url_alias = ActionView::Base.full_sanitizer.sanitize(self.post_title, tags: []).encode(Encoding.find('ASCII'), encoding_options).downcase.gsub(':','-').gsub(' ','-').gsub('--','-').gsub('.','').gsub('/','').gsub(',','').truncate(50, separator: ' ', omission: '')
    self.post_url_alias = url_alias
  end
  
end
