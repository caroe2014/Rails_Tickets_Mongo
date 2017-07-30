class MasterGroupsController < ApplicationController
  before_action :set_master_group, only: [:show, :edit, :update, :destroy]
  before_action :set_company_in_session
  
  # GET /master_groups
  # GET /master_groups.json
  def index
    @master_groups = MasterGroup.all
  end

  # GET /master_groups/1
  # GET /master_groups/1.json
  def show
  end

  # GET /master_groups/new
  def new
    @master_group = MasterGroup.new
  end

  # GET /master_groups/1/edit
  def edit
  end

  # POST /master_groups
  # POST /master_groups.json
  def create
    @master_group = MasterGroup.new(master_group_params)

    respond_to do |format|
      if @master_group.save
        format.html { redirect_to @master_group, notice: 'Master group was successfully created.' }
        format.json { render :show, status: :created, location: @master_group }
      else
        format.html { render :new }
        format.json { render json: @master_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /master_groups/1
  # PATCH/PUT /master_groups/1.json
  def update
    respond_to do |format|
      if @master_group.update(master_group_params)
        format.html { redirect_to @master_group, notice: 'Master group was successfully updated.' }
        format.json { render :show, status: :ok, location: @master_group }
      else
        format.html { render :edit }
        format.json { render json: @master_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /master_groups/1
  # DELETE /master_groups/1.json
  def destroy
    @master_group.destroy
    respond_to do |format|
      format.html { redirect_to master_groups_url, notice: 'Master group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_master_group
      @master_group = MasterGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def master_group_params
      params.require(:master_group).permit(:name, :level, :status)
    end
end
