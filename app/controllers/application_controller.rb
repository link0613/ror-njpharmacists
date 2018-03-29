class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :configure_devise_permitted_parameters, if: :devise_controller?
  before_action :check_if_admin, :instance_var_user, :get_settings, :get_nav_items, :check_if_modal

  rescue_from ActionController::RoutingError, with: -> { render_404  }

  rescue_from Exception do |exception|
    case exception
    when ActionController::UnknownFormat
      render nothing: true, status: :not_acceptable
    when ActionView::MissingTemplate, ActiveRecord::RecordNotFound, ActionController::RoutingError
      render_error 500, nil
    else
      raise exception
    end
  end

  def instance_var_user
    @current_user = current_user
  end
  
  def check_if_admin
    if(user_signed_in? && current_user.cached_membee_id.nil?)
      @is_admin = true
      if !request.original_url.index('/cpanel/').nil?
        @viewing_admin = true
      end
    else
      if !request.original_url.index('/cpanel/').nil?
        sign_out(current_user)
        redirect_to new_user_session_path
      end
    end
  end

  def not_found
    render_error 404, nil
  end
  
  def get_settings
    
      @settings = {}
      Setting.all.each do |setting|
        @settings[setting.setting_name] = { id: setting.id, setting_value: setting.setting_value, setting_attachment: setting.setting_attachment}      
      end

  end
  
  def get_nav_items
    
    @header_nav_items = []
    @footer_nav_items = []
    
    Page.header_menu_pages.each do |header_pg|
      @header_nav_items <<  Rails.cache.fetch([header_pg.id,"header_nav_items"])  { header_pg.get_header_nav_items } 
    end
    
    Page.footer_menu_pages.each do |footer_pg|
      @footer_nav_items << Rails.cache.fetch([footer_pg.id,"footer_nav_items"])  { footer_pg.get_footer_nav_items }
    end
    
  end

  def check_if_modal
    if params[:layout] == 'false'
      @is_modal = true
    end
  end

  def after_sign_in_path_for(resource)
    pages_path
  end
  
  

  private
  def render_error(status, exception)
    respond_to do |format|
      puts "=========================================================="
      puts exception.to_s
      puts "=========================================================="
      format.html { render template: "pages/error_#{status}", layout: 'layouts/application', status: status, exception: exception }
      format.all { render nothing: true, status: status }
    end
  end

  protected
  def configure_devise_permitted_parameters
    registration_params = [:roles, :membee_id, :first_name, :last_name, :email, :password, :password_confirmation]
   
    if params[:action] == 'update'
      devise_parameter_sanitizer.permit(:account_update) { 
        |u| u.permit(registration_params << :current_password)
      }
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.permit(:sign_up) { 
        |u| u.permit(registration_params) 
      }
    end
  end

  
end
