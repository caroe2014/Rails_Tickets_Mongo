class WorkflowMastersController < ApplicationController
  before_action :set_workflow_master, only: [:show, :edit, :update, :destroy]

  # GET /workflow_masters
  # GET /workflow_masters.json
  def index
    @workflow_masters = WorkflowMaster.all
  end

  # GET /workflow_masters/1
  # GET /workflow_masters/1.json
  def show
  end

  # GET /workflow_masters/new
  def new
    @workflow_master = WorkflowMaster.new
  end

  # GET /workflow_masters/1/edit
  def edit
  end

  # POST /workflow_masters
  # POST /workflow_masters.json
  def create
    @workflow_master = WorkflowMaster.new(workflow_master_params)

    respond_to do |format|
      if @workflow_master.save
        format.html { redirect_to @workflow_master, notice: 'Workflow master was successfully created.' }
        format.json { render :show, status: :created, location: @workflow_master }
      else
        format.html { render :new }
        format.json { render json: @workflow_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workflow_masters/1
  # PATCH/PUT /workflow_masters/1.json
  def update
    respond_to do |format|
      if @workflow_master.update(workflow_master_params)
        format.html { redirect_to @workflow_master, notice: 'Workflow master was successfully updated.' }
        format.json { render :show, status: :ok, location: @workflow_master }
      else
        format.html { render :edit }
        format.json { render json: @workflow_master.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workflow_masters/1
  # DELETE /workflow_masters/1.json
  def destroy
    @workflow_master.destroy
    respond_to do |format|
      format.html { redirect_to workflow_masters_url, notice: 'Workflow master was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workflow_master
      @workflow_master = WorkflowMaster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def workflow_master_params
      params.require(:workflow_master).permit(:company_id, :name, :status)
    end
end
