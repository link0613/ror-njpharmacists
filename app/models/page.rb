require 'csv'

class Page < ActiveRecord::Base
  belongs_to :template
  belongs_to :parent_page,
             foreign_key: "parent_page_id",
             class_name: "Page"
             
  has_many    :child_pages,
              foreign_key: 'parent_page_id',
              class_name: 'Page',
              dependent: :delete_all

  has_many :callout_assignments
  has_many :callouts, through: :callout_assignments

  accepts_nested_attributes_for :callouts, :allow_destroy => true
  
  validates_presence_of :url_alias, :page_title
  validates_uniqueness_of :url_alias
  validate :links_are_valid
  
  default_scope { order(:order_num) }

  scope :homepage, -> { where(is_homepage: true).first }

  before_save :ensure_one_home
  after_commit :flush_cache

  def flush_cache
    Rails.cache.clear
  end

  def cached_callout_assignments
    Rails.cache.fetch([self.id,"callout_assignments"]) do
      self.callout_assignments
    end
  end

  def links_are_valid
    link_tags = page_content.scan(/{% link_pg [^}]*%}/)

    link_tags.each do |link_tag|
      @current_link_tag = link_tag
      link_tag = ActionView::Base.full_sanitizer.sanitize(link_tag)
      params = CSV.parse(link_tag.gsub(/({%|%}|link_pg)/,'').strip,{ quote_char: "\x00"}).first
      pg_id = params[4]
      errors.add(:base, "<p>This page uses the following link tag with an invalid/non-existent Page ID #:</p><p><b>#{link_tag}</b><p>") unless params[4].index(/http:/) || (params[4].to_i > 0 && Page.exists?(pg_id))
    end
  rescue => e
    if(@current_link_tag.index(/href/))
      errors.add(:base, "<p>This page contains the following invalid link_pg tag:</p><p><b>#{@current_link_tag}</b></p>" + 
        "<p>This link_pg tag is used to generate a clickable link or button. It does not accept an existing clickable link as a parameter. Please remove the HTML link (appears above as clickable text and as underlined blue text in the content editor below. In the \"Source\" view, it appears in a format similar to \"&lt;a href='url-here'&gt;...&lt;/a&gt;\"). Instead, enter only only the destination URL or internal page ID #.</p>"+
        "<p>The expected format of this tag is:<br><b>{% link_pg TYPE, USE_LIGHTBOX, TARGET_WINDOW, STYLE_CLASSES, DESTINATION, TEXT %}</b></p>"+
        "<ul><li><b>TYPE</b> - (<b>Required</b> - Values: 'button' or 'link') The type of clickable element to show the user, which can be a button or colored text.</li>"+
        "<li><b>USE_LIGHTBOX</b> - (Optional - Values: 'true' or 'false') This allows you to have your destination page open within a small box on the same page. It should only be used to view small amounts of data or images.</li>"+
        "<li><b>TARGET_WINDOW</b> - (Optional - Values: '_self' or '_blank') Leave blank or enter '_self' to have the link open in the same browser window. Enter '_blank' to have the link open in a new tab.</li>"+
        "<li><b>STYLE_CLASSES</b> - (Optional - Advanced Use Only) Intended for advanced styling via Cascading Style Sheets. You can use predefined CSS classes (e.g. btn-large, btn-primary, etc.) or create your own on the <a href='/cpanel/settings/62/edit'>CSS Settings page</a>.</li>"+
        "<li><b>DESTINATION</b> - (<b>Required</b>) The URL or page ID # the link should lead to.</li>"+
        "<li><b>TEXT</b> - (<b>Required</b>) The clickable text that is shown to a user.</li>"+
        "</ul><br><p>Example tags with the minimum required options:<br> <b>{% link_pg link, , , , http://yahoo.com, Go to Yahoo %}<br>{% link_pg button, , , , 1, About NJPhA %}</b></p>")
        
    else
      errors.add(:base, "<p>This page contains the following invalid link_pg tag:</p><p><b>#{@current_link_tag}</b></p><p>Please verify that the destination page ID or URL is plain text, and not HTML code (such as a clickable link):</p>"+
        "<p>The expected format of this tag is:<br><b>{% link_pg TYPE, USE_LIGHTBOX, TARGET_WINDOW, STYLE_CLASSES, DESTINATION, TEXT %}</b></p>"+
        "<ul><li><b>TYPE</b> - (<b>Required</b> - Values: 'button' or 'link') The type of clickable element to show the user, which can be a button or colored text.</li>"+
        "<li><b>USE_LIGHTBOX</b> - (Optional - Values: 'true' or 'false') This allows you to have your destination page open within a small box on the same page. It should only be used to view small amounts of data or images.</li>"+
        "<li><b>TARGET_WINDOW</b> - (Optional - Values: '_self' or '_blank') Leave blank or enter '_self' to have the link open in the same browser window. Enter '_blank' to have the link open in a new tab.</li>"+
        "<li><b>STYLE_CLASSES</b> - (Optional - Advanced Use Only) Intended for advanced styling via Cascading Style Sheets. You can use predefined CSS classes (e.g. btn-large, btn-primary, etc.) or create your own on the <a href='/cpanel/settings/62/edit'>CSS Settings page</a>.</li>"+
        "<li><b>DESTINATION</b> - (<b>Required</b>) The URL or page ID # the link should lead to.</li>"+
        "<li><b>TEXT</b> - (<b>Required</b>) The clickable text that is shown to a user.</li>"+
        "</ul><br><p>Example tags with the minimum required options:<br> <b>{% link_pg link, , , , http://yahoo.com, Go to Yahoo %}<br>{% link_pg button, , , , 1, About NJPhA %}</b></p>")
    end
  end

  def ensure_one_home
    if(self.is_homepage == true)
      old_home = Page.where(is_homepage: true).first
      if(old_home && old_home.id != self.id)
        old_home.is_homepage = false
        old_home.save!
      end
    end
  end

  def self.login_url
    Rails.cache.fetch("login_url") do
      login_pg = Page.where(url_alias: 'member-login').first
      unless login_pg.nil?
        login_pg.build_page_url
      end
    end
  end

  def self.donation_url
    Rails.cache.fetch("donation_url") do
      donation_pg = Page.where(url_alias: 'donate').first
      unless donation_pg.nil?
        donation_pg.build_page_url
      end
    end
  end

  def self.profile_url
    Rails.cache.fetch("profile_url") do
      profile_pg = Page.where(url_alias: 'member-profile').first
      unless profile_pg.nil?
        profile_pg.build_page_url
      end
    end
  end

  def self.registration_url
    Rails.cache.fetch("registration_url") do
      registration_pg = Page.where(url_alias: 'registration').first
      unless registration_pg.nil?
        registration_pg.build_page_url
      end
    end
  end
  
  def self.header_menu_pages
    Rails.cache.fetch("header_nav_items") do
      Page.includes(:child_pages).where('include_in_header_menu = TRUE AND parent_page_id IS NULL AND (is_private = false OR is_private IS NULL)').order(:order_num)
    end
  end
  
  def self.footer_menu_pages
    Rails.cache.fetch("footer_nav_items") do
      Page.includes(:child_pages).where('include_in_footer_menu = TRUE AND parent_page_id IS NULL AND (is_private = false OR is_private IS NULL)').order(:order_num)
    end
  end
  
  def build_page_url
    Rails.cache.fetch([self.id,"page_url"]) do
      return_val = ''
      url_components = self.get_root_parent
      url_components.each do |comp|
        return_val += "/#{comp.url_alias}"
      end
      return_val
    end
  end
  
  def get_root_parent
    path = self.trace_to_root_parent.reverse
    path << self
    return path
  end
  
  def self.root_pages
    @pages = Page.where(parent_page_id: nil).all
  end
    
  def get_nav_items(verify_field)
    Rails.cache.fetch([self.id,verify_field,"nav_items"]) do
      page = self
      
      nav_items = {}
      
    
      nav_items[:page_url] = page.build_page_url
      nav_items[:page_title] = page.page_title
      nav_items[:is_homepage] = page.is_homepage
      nav_items[:id] = page.id
      nav_items[:child_nav_items] = []
                
      page.child_pages.each do |child|
        if(child[verify_field] == true && !child.is_private)
          
          append_val = child.get_nav_items(verify_field)
          if(!append_val.nil?)
            nav_items[:child_nav_items] << append_val
          end
        end
      end
      
      return nav_items
    end
  end
  
  def get_header_nav_items
    Rails.cache.fetch([self.id,"header_nav_items"]) do
      get_nav_items('include_in_header_menu')
    end
  end
  
  def get_footer_nav_items
    Rails.cache.fetch([self.id,"footer_nav_items"]) do
      get_nav_items('include_in_footer_menu')
    end
  end

  
  def get_children
    Rails.cache.fetch([self.id,"children"]) do
      page = self
      pages = []
      page.child_pages.each do |child|
        pages << child
        child_vals = child.get_children
        
        child_vals.each do |nested|
          pages << nested
        end unless child_vals.nil?
        
      end
      return pages
    end
  end
  
  def trace_to_root_parent
    Rails.cache.fetch([self.id,"root_parent"]) do
      parent = self.parent_page
      pages = []
    
      if(!parent.nil?)
        parent_trace = parent.trace_to_root_parent
        pages << self.parent_page 

        parent_trace.each do |x|
          pages << x
        end

      end
      
      return pages
    end
    
  end
  

  
  
end
