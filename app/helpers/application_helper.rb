module ApplicationHelper
  
  def build_footer_nav_column(page,is_root)
    return_val = ""
    
    if (is_root)
      return_val += "<div class='footer-column'><a href='#{page[:page_url]}'><h4 class='green-text'>#{page[:page_title]}</h4></a><ul class='list-unstyled'>"
    else
      return_val += "<li>"
      return_val += "<a href='#{page[:page_url]}' style='display:inline-block;'>#{page[:page_title]}</a>&nbsp;"
      return_val += "</li>"
    end
    
    page[:child_nav_items].each do |child|
      append_val = build_footer_nav_column(child, false)
      if(!append_val.nil?)
        return_val += append_val
      end
    end
    
    
    if (is_root)
      return_val += "</ul></div>"
    end
    return return_val
  end
  
  def build_header_nav_column(page,nav_level)
    return_val = ""
    
    if(nav_level == '')
      return ''
    end
  
    extra_classes = ""

    if(@breadcrumbs && !@breadcrumbs.select{|x| x.id == page[:id]}.empty?)
      extra_classes = "active"
    end

    if (nav_level == 'root')
      return_val += "<li class='dropdown'><a href='#{page[:page_url]}' class='dropdown-toggle #{extra_classes}' id='#{page[:id]}' role='button' data-toggle='dropdown' data-target='#'>#{page[:page_title]}</a><ul class='dropdown-menu' role='menu' aria-labelledby='#{page[:id]}'>"
    elsif(nav_level == 'secondary')
      return_val += "<li role='presentation'>"
      return_val += "<a href='#{page[:page_url]}' style='display:inline-block;' class='#{extra_classes}'>#{page[:page_title]}</a>"
      if(page[:child_nav_items].length > 0)
        return_val += "</li><ul class='list-unstyled'>"
      else
        return_val += "</li>"      
      end
    elsif(nav_level == 'tertiary')
      return_val += "<li role='presentation'>"
      return_val += "<a href='#{page[:page_url]}' style='display:inline-block;' class='#{extra_classes}'>#{ image_tag 'arrow2.png' } #{page[:page_title]}</a>"
      return_val += "</li>"
    end
    
            
    page[:child_nav_items].each do |child|
      next_level = ''

      if(nav_level == 'root')
        next_level = 'secondary'
      elsif(nav_level == 'secondary')
        next_level = 'tertiary'
      else
        next_level = ''
      end
      
      append_val = build_header_nav_column(child, next_level)
      if(!append_val.nil?)
        return_val += append_val
      end
    end

    
    if (nav_level == 'root')
      return_val += "</ul></li>"
    elsif(nav_level == 'secondary')
      if(page[:child_nav_items].length > 0)
        return_val += "</ul>"
      end
    end
    
    return return_val
  end
    
  def build_blog_url(blog_id)
    blog = Blog.find(blog_id)
    return "/blogs/#{blog.blog_url_alias}"
  end
  
  def build_blog_post_url(post_id)
    post = BlogPost.find(post_id)
    blog = post.blog
    return "/blogs/#{blog.blog_url_alias}/#{post.post_url_alias}"
  end
  
  def build_blog_breadcrumbs
    return_val = []
    if(!@blog.nil?)
      return_val << {url_alias: build_blog_url(@blog), page_title: @blog.blog_title }
  
      if(!@blog_post.nil?)
        return_val << { url_alias: build_blog_post_url(@blog_post), page_title: @blog_post.post_title }
      end
    end
    
    return return_val
  end

  def get_home_banners
    banners = {}
    banners[:urls] = []
    banners[:images] = []

    (1..5).each do |x|
      banner_img = get_setting_attachment("Banner #{x} Image")
      banner_url = get_setting_value("Banner #{x} URL")
      unless banner_img.nil?
        banners[:images] << banner_img.url
        banners[:urls] << banner_url
      end
    end
    return banners
  end

  def get_home_ad_banner
    banner = {}
    banner[:url] = []
    banner[:image] = []

    
    banner_img = get_setting_attachment("Banner Ad Image")
    banner_url = get_setting_value("Banner Ad URL")
    unless banner_img.nil?
      banner[:image] = banner_img.url
      banner[:url] = banner_url
    end
    
    return banner
  end
  
  def get_setting_attachment(setting_name)
    
    if(@settings[setting_name])
      begin
        @settings[setting_name][:setting_attachment].exists? ? @settings[setting_name][:setting_attachment] : nil
      rescue
        nil
      end
    end
  end
  
  def get_setting_value(setting_name)
    if(@settings[setting_name])
      @settings[setting_name][:setting_value]
    end
  end

  def size_body_content_area
    if @viewing_admin
      return "col-xs-10"
    elsif @page && @page.cached_callout_assignments && @page.cached_callout_assignments.count > 0
      return "col-xs-9"
    elsif @page && @page.cached_callout_assignments && @page.cached_callout_assignments.count == 0
      return "col-xs-12"
    else
      return "col-xs-12"
    end

  end

  def meta_title
    return "New Jersey Pharmacists Association" unless @page
    if @page.meta_title.nil? || @page.meta_title.blank?
      return @pg_title.nil? ? @pg_title : "New Jersey Pharmacists Association"
    else
      return @page.meta_title
    end
  end

  def render_liquid_content(content, instance_vars = {})
    Liquid::Template.parse(content).render({}, {registers: { user: @current_user,  instance_vars: instance_vars }})
  end

  def render_liquid_content_article(content, instance_vars = {})
    Liquid::Template.parse(content).render({}, {registers: { user: @current_user,  instance_vars: instance_vars }})
  end

  def render_liquid_faculty_proposel(content, instance_vars = {})
    Liquid::Template.parse(content).render({}, {registers: { user: @current_user,  instance_vars: instance_vars }})
  end  
  
end
