class PrintingTicketsController < ApplicationController
  before_action :verify_logged_in_user
  before_action :set_printing_ticket, only: [:show, :edit, :update, :destroy]
  before_action :set_company_in_session
  before_action :set_project_from_params
  
  # GET /printing_tickets
  # GET /printing_tickets.json
  def index
    
    @printing_tickets = PrintingTicket.where(project_id: @project_id).order_by(:location_id => 'asc').order_by(:created_at => 'desc')
#    session[:project_id] = @project_id
  end

  # GET /printing_tickets/1
  # GET /printing_tickets/1.json
  def show
  end

  # GET /printing_tickets/new
  def new
    
    @printing_ticket = PrintingTicket.new    
    @printing_ticket.project_id = @project_id  
  end

  # GET /printing_tickets/1/edit
  def edit
    fillup_company_name
    
  end

  # POST /printing_tickets
  # POST /printing_tickets.json
  def create

    @printing_ticket = PrintingTicket.new(printing_ticket_params)
 
#    material = BSON::ObjectId.from_string(@printing_ticket.material_id)
#    equipment = BSON::ObjectId.from_string(@printing_ticket.equipment_id)
#    @printing_ticket.material_id = material
#    @printing_ticket.equipment_id = equipment
        
    respond_to do |format|
      @project_id = @printing_ticket.project_id
      if @printing_ticket.save
        format.html { redirect_to project_printing_tickets_url(@project_id), notice: 'Printing ticket was successfully created.' }
        format.json { render :index, status: :created, location: @printing_ticket }
      else
        format.html { render :new }
        format.json { render json: @printing_ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /printing_tickets/1
  # PATCH/PUT /printing_tickets/1.json
  def update
    @project_id = @printing_ticket.project_id    
    respond_to do |format|
      if @printing_ticket.update(printing_ticket_params)
        format.html { redirect_to project_printing_tickets_url(@project_id), notice: 'Printing ticket was successfully updated.' }
        format.json { render :show, status: :ok, location: @printing_ticket }
      else
        format.html { render :edit }
        format.json { render json: @printing_ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /printing_tickets/1
  # DELETE /printing_tickets/1.json
  def destroy
    @project_id = @printing_ticket.project_id
    @printing_ticket.destroy
    respond_to do |format|
      format.html { redirect_to project_printing_tickets_url(@project_id) , notice: 'Printing ticket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    def fillup_company_name
      if user_signed_in?
          if defined? session[:company_id]
             @company_name = session[:company_id]
          end
      end
    end
  
    # Use callbacks to share common setup or constraints between actions.
    def set_printing_ticket
      @printing_ticket = PrintingTicket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def printing_ticket_params
      debugger
      params.require(:printing_ticket).permit(:name, :subname, :description, :width, :height, :qty, :single, :double, :material_id, :equipment_id, :project_id, :job_state_id, :material_idc, :location_id)
    end
    
    def set_project_from_params
        
       @project_id = params[:project_id]
       
    end
    
end
