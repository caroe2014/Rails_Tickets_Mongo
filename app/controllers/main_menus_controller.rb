class MainMenusController < ApplicationController
  
  before_action :verify_logged_in_user
  before_action :set_company_in_session
    
  def home        
    
    if user_signed_in?
       if defined? @company
         @company_name = @company
       end
    end
  end

  def login
  end

  def logout
  end

  def report
  end

  def profile
  end
  
  private
    
end
