class SlidingDiv < Liquid::Block
  def initialize(name, params, tokens)
     super
     @label_content = params
  end

  def render(context)
    return_val = super
    return_val = "<div class='sliding-div'><a class='expand-link'>#{@label_content}</a><br><div class='hidden-div-setup'>#{return_val}</div></div>"
    return return_val
    
  end
end

Liquid::Template.register_tag('sliding_div', SlidingDiv)