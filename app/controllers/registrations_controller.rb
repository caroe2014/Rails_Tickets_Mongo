class RegistrationsController < Devise::RegistrationsController
  prepend_before_action :require_no_authentication, only: [:new, :create, :cancel, :show]
  
  def new
    build_resource({})
    yield resource if block_given?
    respond_with resource
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

  # GET /resource/edit
  def edit
    render :edit
  end

  # PUT /resource
  # We need to use a copy of the resource because we don't want to change
  # the current user in place.
  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

    resource_updated = update_resource(resource, account_update_params)
    yield resource if block_given?
    if resource_updated
      if is_flashing_format?
        flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
          :update_needs_confirmation : :updated
        set_flash_message :notice, flash_key
      end
      bypass_sign_in resource, scope: resource_name
      respond_with resource, location: after_update_path_for(resource)
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end    

  # DELETE /resource
  def destroy
    resource.destroy
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    set_flash_message! :notice, :destroyed
    yield resource if block_given?
    respond_with_navigational(resource){ redirect_to after_sign_out_path_for(resource_name) }
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  def cancel
    expire_data_after_sign_in!
    redirect_to new_registration_path(resource_name)
  end

  def show
    render :show
  end

  protected  
  # The path used after sign up. You need to overwrite this method
  # in your own RegistrationsController.
  def after_sign_up_path_for(resource)
       '/company_groups/new' 

  end
  
  def after_inactive_sign_up_path_for
    super
  end

  def generate_token
     o = [('a'..'z'), ('A'..'Z'), ('0'..'9')].map(&:to_a).flatten
     result = string = (0...50).map { o[rand(o.length)] }.join
     result
  end
  
  def sign_up_params
     params.require(:user).permit(:first_name, :last_name, :cellphone, :start, :expire, :token_id, :email, :encrypted_password, 
     :password, :password_confirmation,
     :reset_password_token, :reset_password_sent_at, :remember_created_at, :sign_in_count, :current_sign_in_at, :last_sign_in_at,
     :current_sign_in_ip, :last_sign_in_ip)
  end
  
  def account_update_params
     params.require(:user).permit(:first_name, :last_name, :cellphone, :start, :expire, :token_id, :email, :encrypted_password, 
     :reset_password_token, :reset_password_sent_at, :remember_created_at, :sign_in_count, :current_sign_in_at, :last_sign_in_at,
     :current_sign_in_ip, :last_sign_in_ip)   
  end
  
end