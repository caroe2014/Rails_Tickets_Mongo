class MasterMaterialsController < ApplicationController
  before_action :set_master_material, only: [:show, :edit, :update, :destroy]

  # GET /master_materials
  # GET /master_materials.json
  def index
    @master_materials = MasterMaterial.all
  end

  # GET /master_materials/1
  # GET /master_materials/1.json
  def show
  end

  # GET /master_materials/new
  def new
    @master_material = MasterMaterial.new
  end

  # GET /master_materials/1/edit
  def edit
  end

  # POST /master_materials
  # POST /master_materials.json
  def create
    @master_material = MasterMaterial.new(master_material_params)

    respond_to do |format|
      if @master_material.save
        format.html { redirect_to @master_material, notice: 'Master material was successfully created.' }
        format.json { render :show, status: :created, location: @master_material }
        format.js
      else
        format.html { render :new }
        format.json { render json: @master_material.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /master_materials/1
  # PATCH/PUT /master_materials/1.json
  def update
    respond_to do |format|
      if @master_material.update(master_material_params)
        format.html { redirect_to @master_material, notice: 'Master material was successfully updated.' }
        format.json { render :show, status: :ok, location: @master_material }
      else
        format.html { render :edit }
        format.json { render json: @master_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /master_materials/1
  # DELETE /master_materials/1.json
  def destroy
    @master_material.destroy
    respond_to do |format|
      format.html { redirect_to master_materials_url, notice: 'Master material was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_master_material
      @master_material = MasterMaterial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def master_material_params
      params.require(:master_material).permit(:name, :description, :material_type, :width, :length, :units, :unit_cost, :quantity, :quantity_cost, :status)
    end
end
