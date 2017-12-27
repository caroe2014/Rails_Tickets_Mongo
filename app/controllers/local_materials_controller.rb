class LocalMaterialsController < ApplicationController
  before_action :verify_logged_in_user
  before_action :set_local_material, only: [:show, :edit, :update, :destroy]
  before_action :set_company_in_session

  # GET /local_materials
  # GET /local_materials.json
  def index    
#     @locations = Location.where( { :company_id => @company._id } )   
    
#     @local_materials = LocalMaterial.where( {:location_id => @locations._id } )
      @local_materials = LocalMaterial.all
  end

  # GET /local_materials/1
  # GET /local_materials/1.json
  def show
  end

  # GET /local_materials/new
  def new
    @local_material = LocalMaterial.new
  end

  # GET /local_materials/1/edit
  def edit
  end

  # POST /local_materials
  # POST /local_materials.json
  def create
    @local_material = LocalMaterial.new(local_material_params)

    respond_to do |format|
      if @local_material.save
        format.html { redirect_to @local_material, notice: 'Local material was successfully created.' }
        format.json { render :show, status: :created, location: @local_material }
      else
        format.html { render :new }
        format.json { render json: @local_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /local_materials/1
  # PATCH/PUT /local_materials/1.json
  def update
    respond_to do |format|
      if @local_material.update(local_material_params)
        format.html { redirect_to @local_material, notice: 'Local material was successfully updated.' }
        format.json { render :show, status: :ok, location: @local_material }
      else
        format.html { render :edit }
        format.json { render json: @local_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /local_materials/1
  # DELETE /local_materials/1.json
  def destroy
    @local_material.destroy
    respond_to do |format|
      format.html { redirect_to local_materials_url, notice: 'Local material was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
 
    # Use callbacks to share common setup or constraints between actions.
    def set_local_material
      @local_material = LocalMaterial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def local_material_params
      params.require(:local_material).permit(:company_id, :location_id, :name, :minimum, :maximum, :quantity, :production_cost, :status)
    end
end
