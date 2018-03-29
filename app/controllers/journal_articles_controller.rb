class JournalArticlesController < ApplicationController
before_action :set_journal, only: [:show, :edit, :update, :destroy]
  
  def create
    @journal = JournalArticle.new(journal_article_params)
    @verified_recaptcha = verify_recaptcha(model:@journal) 
    if @verified_recaptcha
      if @journal.save
        respond_to do |format|
          format.html { redirect_to  journal_articles_path, notice: 'Journal Article was successfully created.' }
          format.js
        end 
      else
        render "edit"
      end
    end
  end

  def index
  end

  def edit
  end

  def show
  end

  def destroy
    @journal.destroy!
    redirect_to journal_articles_path
  end

  def new
   @journal = JournalArticle.new 
  end

  def update
    if @journal.update(journal_article_params)
      redirect_to journal_articles_path, notice: 'Journal Article was successfully updated.'
    else
      render action: 'edit'
    end
  end

private
  # Only allow a trusted parameter "white list" through.

  def set_journal
    @journal = JournalArticle.find(params[:id])
  end

  def journal_article_params
    params.require(:journal_article).permit(:name, :phone, :email, :article_title, :abstract)
  end

end
