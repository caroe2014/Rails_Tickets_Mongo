class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception
  helper FullCountrySelect::ApiHelper
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  # helper FullCountrySelect::ApiHelper.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' } 
  respond_to :html, :js, :json
  helper :company_groups
  
  def verify_logged_in_user
                               
        if ! user_signed_in?
           redirect_to new_user_session_path
        else
          @user = User.where( { :email => current_user.email } ).first
                   
          @cg   = CompanyGroup.where( { :user_id => @user._id } ).first
                  
          @company = Company.where( { :_id => @cg.company_id } ) .first
                  
          @mastergroup = MasterGroup.where( {:_id => @cg.mastergroup_id } ).first
                    
          session[:company_id] = @company._id.to_s
          session[:user_id] = @user._id.to_s
          session[:mastergroup_id] = @mastergroup._id.to_s  
        
        end
    

  end
  
  def set_company_in_session                
      @company = Company.find( session[:company_id] )
      @company_name = @company.name         
  end 
      
  protected
     
    def configure_permitted_parameters
      registration_params = [:firstName, :lastName, :cellphone, :start, :expire, :email, :password, :password_confirmation]
      if params[:action] == 'update'
        devise_parameter_sanitizer.sanitize(:account_update) { 
        |u| u.permit(registration_params << :current_password)
      }
      elsif params[:action] == 'create'
        devise_parameter_sanitizer.sanitize(:sign_up) { 
        |u| u.permit(registration_params) 
      }
      end
    end 
end
