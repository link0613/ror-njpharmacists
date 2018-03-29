require_relative 'no_request_controller'

class AddStaticPage < Liquid::Tag
  def initialize(tag_name, args, tokens)
    super

  end

  def render(context)
    @article = context.registers[:instance_vars][:article]
    ActionView::Base.new('app/views', {}, ActionController::Base.new).render(partial: '/application/add_static_page', locals: { article: context.registers[:instance_vars][:article] })
  end

end

Liquid::Template.register_tag('add_static_page', AddStaticPage)