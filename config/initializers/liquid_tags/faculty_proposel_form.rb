require_relative 'no_request_controller'

class FacultyProposelForm < Liquid::Tag
  def initialize(tag_name, args, tokens)
    super

  end

  def render(context)
  	@faculty_proposel = context.registers[:instance_vars][:faculty_proposel]
  	ActionView::Base.new('app/views', {}, ActionController::Base.new).render(partial: '/application/faculty_proposel_form', locals: { faculty_proposel: context.registers[:instance_vars][:faculty_proposel] ,url: context.registers[:instance_vars][:path], form_request: context.registers[:instance_vars][:remote] })
  end
end

Liquid::Template.register_tag('faculty_proposel_form', FacultyProposelForm)