require_relative 'no_request_controller'

class Link < Liquid::Tag
  def initialize(tag_name, args, tokens)
    super
    @args = args.split(',')

    @link_type = @args[0].strip.try(:gsub,'\'','').try(:gsub,"\"",'')
    @is_modal = @args[1].strip.try(:gsub,'\'','').try(:gsub,"\"",'')
    @link_target = @args[2].strip.try(:gsub,'\'','').try(:gsub,"\"",'')
    @link_classes = @args[3].strip.try(:gsub,'\'','').try(:gsub,"\"",'').try(:gsub,",",'')
    @pg_id = ActionView::Base.full_sanitizer.sanitize(@args[4].strip.try(:gsub,'\'','').try(:gsub,"\"",''))
    @title = @args[5].strip

    if(@pg_id.to_i > 0)
      @pg_url = Page.find_by_id(@pg_id).try(:build_page_url) || "/about-us"
    else
      @pg_url = @pg_id
    end

  end

  def render(context)
    ActionView::Base.new('app/views', {}, ActionController::Base.new).render(partial: '/application/link_pg', locals: {pg_url: @pg_url, title: @title, is_modal: @is_modal, link_type: @link_type, link_classes: @link_classes, link_target: @link_target})
    
  end

end

Liquid::Template.register_tag('link_pg', Link)