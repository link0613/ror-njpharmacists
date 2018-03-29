class PagesController < ApplicationController

  before_action :get_page, only: :show

  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.where(parent_page_id: nil).all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pages }
    end
  end
  
  def error_404
    render :error_404, status: 404
  end
  
  def error_500
    render :error_500, status: 500
  end

  def show_pdf
    @is_modal = true
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    
    if @page.is_redirect == true
      redirect_to @page.redirect_url
    else

      if (@page.is_members_only == true && (!user_signed_in? || current_user.cached_membee_id.nil? || current_user.cached_membee_id.blank?))
        sign_out(current_user)
        redirect_to "#{Page.login_url}?pg_id=#{@page.id}"

      else
        @breadcrumbs = @page.get_root_parent
        @meta_keywords = @page.meta_keywords
        @meta_descript = @page.meta_description
        @pg_title = @page.page_title
        
        @content = @page.page_content
        @assigned_callouts = @page.cached_callout_assignments
        
        respond_to do |format|
          format.html # show.html.erb
          format.json { render json: @page }
        end  
      end
    end
  
  end

  # GET /pages/new
  # GET /pages/new.json
  def new
    @page = Page.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @page }
    end
  end

  # GET /pages/1/edit
  def edit
    @page = Page.find(page_params[:id])
  end

  def manage_callouts
  end

  def duplicate
    copy = Page.find(params[:page_id]).dup
    copy.page_title = "Copy of #{copy.page_title}"
    copy.url_alias = "#{copy.url_alias}-copy"
    copy.save!
    copy.url_alias = "#{copy.url_alias}-#{copy.id}"
    copy.include_in_header_menu = false
    copy.include_in_footer_menu = false
    copy.is_private = true
    copy.save!
    redirect_to pages_path
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = Page.new(page_params)

    respond_to do |format|
      if @page.save
        format.html { redirect_to pages_path, notice: 'Page was successfully created.' }
        format.json { render json: @page, status: :created, location: @page }
      else
        format.html { render action: "new" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pages/1
  # PUT /pages/1.json
  def update
    @page = Page.find(params[:id])

    if(params[:page][:callout_ids])
      @page.callouts.clear
      params[:page][:callout_ids].each do |id|
        if(!id.blank?)
          @page.callouts << Callout.find(id)
        end
      end
    end

    redirect_url = params[:continue_editing] != '1' ? pages_url : edit_page_url(@page)

    respond_to do |format|
      if ((page_params[:callout_ids] && @page.save!) || @page.update_attributes(page_params))
        format.html { redirect_to redirect_url, notice: 'Page was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    respond_to do |format|
      format.html { redirect_to pages_url }
      format.json { head :no_content }
    end
  end
  
  def home
    @is_home = true
  end 

  def logout_member
    redirect_to "https://memberservices.membee.com/feeds/Login/Logout.aspx?ClientID=955&AppID=1062&ReturnURL=http://njpharmacists.org/finalize_logout"
  end

  def search_results

  end

  def finalize_logout
    sign_out current_user
    redirect_to root_path
  end

  def check_login

    if(current_user && !current_user.cached_membee_id.nil?)
      if(params[:pg_id].to_i > 0)
        target_pg = Page.find(params[:pg_id])
      else
        target_pg = nil
      end
      if(target_pg.nil?)
        redirect_to Page.profile_url
      else
        redirect_to Page.find(params[:pg_id]).build_page_url
      end

    else

      if(!params['error'].nil? || !params['error'].blank?)

        redirect_to "#{Page.login_url}?pg_id=#{params[:pg_id]}", flash: { error: params[:error_description] }
      else
        # TODO: Exchange token for ID
        # membeeInfo = API Call

        membeeInfo = HTTParty.get "https://memberservices.membee.com/feeds/Profile/ExchangeTokenForID/?APIKEY=48fcd0e2-d6ca-4acc-8224-1d30356dbbd7&ClientID=955&AppID=1062&Token=#{params[:token]}"

        if User.where(membee_id: "#{membeeInfo['UserID']}").first.nil?
          User.create({
              email: membeeInfo['Email'], 
              first_name: membeeInfo['FirstName'], 
              last_name: membeeInfo['LastName'], 
              roles: (membeeInfo['Roles'].nil? ? '' : membeeInfo['Roles'].join(',')),
              membee_id: "#{membeeInfo['UserID']}", 
              password: 'asdre546445wetrtgyh54yg'})
        else
          user = User.where(membee_id: "#{membeeInfo['UserID']}").first
          user.email = membeeInfo['Email']
          user.first_name = membeeInfo['FirstName']
          user.last_name = membeeInfo['LastName']
          user.roles = membeeInfo['Roles'].join(',') unless membeeInfo['Roles'].nil?
          user.membee_id = "#{membeeInfo['UserID']}"
          user.save!
        end

        if(user = User.where(membee_id: "#{membeeInfo['UserID']}").first)
          sign_in(user , :bypass => true)
        end

        if(params[:pg_id].to_i > 0)
          target_pg = Page.find(params[:pg_id])
        else
          target_pg = nil
        end
        if(target_pg.nil?)
          redirect_to Page.profile_url
        else
          redirect_to Page.find(params[:pg_id]).build_page_url
        end
      end
    end
  end

  private
  def page_params
    if(@_action_name != 'update' && @_action_name != 'create')
      params.permit!
    else
      params.require(:page).permit(:meta_description, :meta_keywords, :meta_title, :page_content, :page_title, :url_alias, :template_id, :parent_page_id, :order_num, :include_in_header_menu, :include_in_footer_menu, :is_redirect, :redirect_url, :is_members_only, :is_homepage, :is_private, callout_attributes: [:id])
    end
  end

  def get_page
    
    if(page_params[:id])
      @page = Rails.cache.fetch([page_params[:id],"page_id"]) { Page.find(page_params[:id]) || not_found }
    else
      if(page_params[:path].nil? || page_params[:path].blank?)
        @page = Rails.cache.fetch('homepage') { Page.where(is_homepage: true).first }
        @is_home = true
      else 
        @alias = page_params[:path].split('/').last
        if(page_params[:path].split('/').length > 1)
          parent_alias = page_params[:path].split('/')
          parent_alias = parent_alias[parent_alias.length-2]
          parent_page = Rails.cache.fetch([parent_alias,"parent_page"]) { Page.where(url_alias: parent_alias).first }
          if(parent_page.nil?)
            return not_found
          end
          @page = Rails.cache.fetch([@alias,"page_alias","parent_page",parent_page.id]) { Page.where(url_alias: @alias, parent_page_id: parent_page.id).first }
        else
          @page = Rails.cache.fetch([@alias,"page_alias"]) { Page.where(url_alias: @alias, parent_page_id: nil).first }
        end
      end
    end

    if(@page && @page.is_private == true && (!user_signed_in? || @is_admin.nil?))
      return not_found
    end

  end

  

end
