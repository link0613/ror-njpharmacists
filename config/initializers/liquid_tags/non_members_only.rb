class NonMembersOnly < Liquid::Block
  def initialize(tag_name, markup, tokens)
     super
     @content = markup
  end

  def render(context)
    if(!context.registers[:user].nil?)
      return ''
    else
      return super
    end
  end
end

Liquid::Template.register_tag('non_members_only', NonMembersOnly)