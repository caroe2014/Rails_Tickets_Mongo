module CompanyGroupsHelper

  def create_cia_group (company_group)
    company_group = CompanyGroup.new(company_group_params_helper)

    respond_to do |format|
      if company_group.save
        format.html { redirect_to company_group, notice: 'Company group was successfully created.' }
        format.json { render :show, status: :created, location: company_group }
      else
        format.html { render :new }
        format.json { render json: company_group.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def company_group_params_helper
      params.require(:company_group).permit(:company_id, :user_id, :master_group_id, :status)
  end  
  
end
