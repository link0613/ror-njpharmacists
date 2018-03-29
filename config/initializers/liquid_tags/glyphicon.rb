require_relative 'no_request_controller'

class Glyphicon < Liquid::Tag
  def initialize(tag_name, args, tokens)
    super
    @args = args.split(',')

    @icon_type = @args[0].strip

  end

  def render(context)
    ActionView::Base.new('app/views', {}, ActionController::Base.new).render(partial: '/application/glyphicon', locals: {icon_type: @icon_type})
    
  end

end

Liquid::Template.register_tag('icon', Glyphicon)