class WorkflowDetailsController < ApplicationController
  before_action :set_workflow_detail, only: [:show, :edit, :update, :destroy]

  # GET /workflow_details
  # GET /workflow_details.json
  def index
    @workflow_details = WorkflowDetail.all
  end

  # GET /workflow_details/1
  # GET /workflow_details/1.json
  def show
  end

  # GET /workflow_details/new
  def new
    @workflow_detail = WorkflowDetail.new
  end

  # GET /workflow_details/1/edit
  def edit
  end

  # POST /workflow_details
  # POST /workflow_details.json
  def create
    @workflow_detail = WorkflowDetail.new(workflow_detail_params)

    respond_to do |format|
      if @workflow_detail.save
        format.html { redirect_to @workflow_detail, notice: 'Workflow detail was successfully created.' }
        format.json { render :show, status: :created, location: @workflow_detail }
      else
        format.html { render :new }
        format.json { render json: @workflow_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workflow_details/1
  # PATCH/PUT /workflow_details/1.json
  def update
    respond_to do |format|
      if @workflow_detail.update(workflow_detail_params)
        format.html { redirect_to @workflow_detail, notice: 'Workflow detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @workflow_detail }
      else
        format.html { render :edit }
        format.json { render json: @workflow_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workflow_details/1
  # DELETE /workflow_details/1.json
  def destroy
    @workflow_detail.destroy
    respond_to do |format|
      format.html { redirect_to workflow_details_url, notice: 'Workflow detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workflow_detail
      @workflow_detail = WorkflowDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def workflow_detail_params
      params.require(:workflow_detail).permit(:company_id, :workflow_master_id, :next, :previous)
    end
end
