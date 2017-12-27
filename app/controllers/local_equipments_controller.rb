class LocalEquipmentsController < ApplicationController

  before_action :verify_logged_in_user
  before_action :set_local_equipment, only: [:show, :edit, :update, :destroy]
  before_action :set_company_in_session
  
  # GET /local_equipments
  # GET /local_equipments.json
  def index
    
    @local_equipments = LocalEquipment.all
  end

  # GET /local_equipments/1
  # GET /local_equipments/1.json
  def show
  end

  # GET /local_equipments/new
  def new
    @local_equipment = LocalEquipment.new
  end

  # GET /local_equipments/1/edit
  def edit
  end

  # POST /local_equipments
  # POST /local_equipments.json
  def create
    @local_equipment = LocalEquipment.new(local_equipment_params)

    respond_to do |format|
      if @local_equipment.save
        format.html { redirect_to @local_equipment, notice: 'Local equipment was successfully created.' }
        format.json { render :show, status: :created, location: @local_equipment }
      else
        format.html { render :new }
        format.json { render json: @local_equipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /local_equipments/1
  # PATCH/PUT /local_equipments/1.json
  def update
    respond_to do |format|
      if @local_equipment.update(local_equipment_params)
        format.html { redirect_to @local_equipment, notice: 'Local equipment was successfully updated.' }
        format.json { render :show, status: :ok, location: @local_equipment }
      else
        format.html { render :edit }
        format.json { render json: @local_equipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /local_equipments/1
  # DELETE /local_equipments/1.json
  def destroy
    @local_equipment.destroy
    respond_to do |format|
      format.html { redirect_to local_equipments_url, notice: 'Local equipment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_local_equipment
      @local_equipment = LocalEquipment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def local_equipment_params
      params.require(:local_equipment).permit(:name, :equipment_type, :production_per_hour, :status, :location_id)
    end
end
