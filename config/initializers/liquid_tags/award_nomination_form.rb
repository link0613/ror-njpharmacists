require_relative 'no_request_controller'

class AwardNominationForm < Liquid::Tag
  def initialize(tag_name, args, tokens)
    super

  end

  def render(context)
  	@nomination = context.registers[:instance_vars][:nomination]
    ActionView::Base.new('app/views', {}, ActionController::Base.new).render(partial: '/application/award_nomination_form', locals: { nomination: context.registers[:instance_vars][:nomination] })
  end

end

Liquid::Template.register_tag('award_nomination_form', AwardNominationForm)