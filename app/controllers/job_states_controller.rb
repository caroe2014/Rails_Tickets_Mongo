class JobStatesController < ApplicationController
  before_action :set_job_state, only: [:show, :edit, :update, :destroy]

  # GET /job_states
  # GET /job_states.json
  def index
    @job_states = JobState.all.order_by(:step_number => 'asc')
  end

  # GET /job_states/1
  # GET /job_states/1.json
  def show
    render json: @job_state
  end

  # GET /job_states/new
  def new
    @job_state = JobState.new
  end

  # GET /job_states/1/edit
  def edit
  end

  # POST /job_states
  # POST /job_states.json
  def create
    @job_state = JobState.new(job_state_params)

    respond_to do |format|
      if @job_state.save
#        format.html { redirect_to @job_state, notice: 'Job state was successfully created.' }
        format.html { redirect_to job_states_path, notice: 'Job state was successfully created.' }
        format.json { render :index, status: :created, location: @job_state }
      else
        format.html { render :new }
        format.json { render json: @job_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_states/1
  # PATCH/PUT /job_states/1.json
  def update
    respond_to do |format|
      if @job_state.update(job_state_params)
        format.html { redirect_to job_states_path, notice: 'Job state was successfully updated.' }
        format.json { render :index, status: :ok, location: @job_state }
      else
        format.html { render :edit }
        format.json { render json: @job_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_states/1
  # DELETE /job_states/1.json
  def destroy
    @job_state.destroy
    respond_to do |format|
      format.html { redirect_to job_states_url, notice: 'Job state was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_state
      @job_state = JobState.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_state_params
      params.require(:job_state).permit(:step_number, :name, :color, :status)
    end
end
