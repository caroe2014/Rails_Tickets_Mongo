class TicketsController < ApplicationController
  before_action :set_project_from_params
  before_action :set_company_in_session
    
  respond_to :html, :json

  def index
    
    @project_id = if params[:project_id].present?
                     params[:project_id]
                  elsif params[:id].present?
                     params[:id]
                  end   

    @tickets = PrintingTicket.where(project_id: @project_id)
         
    respond_to do |format|
      format.html
      format.json { render json: @tickets }
    end
  end

  def create
    respond_with PrintingTicket.create(printing_ticket_params)
   
  end

  def show
                      
    @ticket = PrintingTicket.find(params[:id])
   respond_to do |format|
     format.html
     format.json { render json: @ticket }
   end 
  end

  def update
    respond_to do |format|
      if @printing_ticket.update(printing_ticket_params)
        format.html 
        format.json { render json: @printing_ticket, status: :ok, location: @printing_ticket }
      else
        format.html 
        format.json { render json: @printing_ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_with PrintingTicket.destroy(params[:id])
  end

  private

    def printing_ticket_params
  
      params.require(:printing_tickets).permit(:name, :subname, :description, :width, :height, :qty, :single, :double, :material_id, :equipment_id, :project_id, :material_idc, :location_id)
    end

    def set_project_from_params
        
       @project_id = params[:project_id]
       @company_id = Project.find(params[:project_id]).company_id
       
    end
      
end
