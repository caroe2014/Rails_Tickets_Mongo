class PrintingTicketsController < ApplicationController
  before_action :set_printing_ticket, only: [:show, :edit, :update, :destroy]
  before_action :set_company_in_session
  
  # GET /printing_tickets
  # GET /printing_tickets.json
  def index
    @printing_tickets = PrintingTicket.all
  end

  # GET /printing_tickets/1
  # GET /printing_tickets/1.json
  def show
  end

  # GET /printing_tickets/new
  def new
    @printing_ticket = PrintingTicket.new
  end

  # GET /printing_tickets/1/edit
  def edit
  end

  # POST /printing_tickets
  # POST /printing_tickets.json
  def create
    @printing_ticket = PrintingTicket.new(printing_ticket_params)
       
    respond_to do |format|

      if @printing_ticket.save
        format.html { redirect_to @printing_ticket, notice: 'Printing ticket was successfully created.' }
        format.json { render :show, status: :created, location: @printing_ticket }
      else
        format.html { render :new }
        format.json { render json: @printing_ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /printing_tickets/1
  # PATCH/PUT /printing_tickets/1.json
  def update
    respond_to do |format|
      if @printing_ticket.update(printing_ticket_params)
        format.html { redirect_to @printing_ticket, notice: 'Printing ticket was successfully updated.' }
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
    @printing_ticket.destroy
    respond_to do |format|
      format.html { redirect_to printing_tickets_url, notice: 'Printing ticket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_printing_ticket
      @printing_ticket = PrintingTicket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def printing_ticket_params
      params.require(:printing_ticket).permit(:name, :subname, :description, :width, :height, :qty, :single, :double, :material_id, :equipment_id, :material_idc, :equipment_idc, :location_id, :printer_id)
    end
end
