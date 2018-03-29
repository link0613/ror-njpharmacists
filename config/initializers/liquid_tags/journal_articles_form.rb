require_relative 'no_request_controller'

class JournalArticlesForm < Liquid::Tag
  def initialize(tag_name, args, tokens)
    super

  end

  def render(context)
    @article = context.registers[:instance_vars][:article]
    ActionView::Base.new('app/views', {}, ActionController::Base.new).render(partial: '/application/journal_articles_form', locals: { article: context.registers[:instance_vars][:article] })
  end

end

Liquid::Template.register_tag('journal_articles_form', JournalArticlesForm)