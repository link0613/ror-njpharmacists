require_relative 'no_request_controller'

class Gallery < Liquid::Tag
  def initialize(tag_name, args, tokens)
     super
     @args = args.split(',')
     @images = @args[1..@args.size-1]
  end

  def render(context)
  	ActionView::Base.new('app/views', {}, ActionController::Base.new)
  			.render(
  				partial: '/application/gallery', 
  				locals: {id: @args[0], images: @images}
  			)
    
  end
end

Liquid::Template.register_tag('gallery', Gallery)