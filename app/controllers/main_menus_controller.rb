class MainMenusController < ApplicationController
  
  before_action :verify_logged_in_user
  
  def home
    @company_name = "Prueba LLC"
    if user_signed_in?
       if defined? @company
         @company_name = @company.name
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
end
