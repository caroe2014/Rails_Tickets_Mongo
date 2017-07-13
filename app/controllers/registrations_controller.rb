class RegistrationsController < Devise::RegistrationsController
  prepend_before_action :require_no_authentication, only: [:new, :create, :cancel, :show]
  def new
    super
  end

 # POST /resource
  def create
    build_resource(sign_up_params)
    
    session[:token_id] = generate_token
    resource.token_id = session[:token_id]
    
    resource.save
    yield resource if block_given?
    if resource.persisted?
            
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  def edit
    super
  end

  def update
    super
  end

  def destroy
    super
  end

  def cancel
    super
  end

  def show
    render :show
  end

  protected  
  # The path used after sign up. You need to overwrite this method
  # in your own RegistrationsController.
  def after_sign_up_path_for(resource)
       '/company_groups/new' 
#    case resource
#    when :user, User
#      '/company_groups/new'
#    else
#      super
#    end
  end
  
  def after_inactive_sign_up_path_for
    super
  end

  def generate_token
     o = [('a'..'z'), ('A'..'Z'), ('0'..'9')].map(&:to_a).flatten
     result = string = (0...50).map { o[rand(o.length)] }.join
     result
  end
  
end