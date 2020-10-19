class JobAplicationsController < ApplicationController
  before_action :set_job_aplication, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!

  $education =  ["SSS", "VŠS", "VSS"]


  # GET /job_aplications
  # GET /job_aplications.json
  def index
    @job_aplications = JobAplication.all
    @jobs = Job.all
  end

  # GET /job_aplications/1
  # GET /job_aplications/1.json
  def show
  end

  # GET /job_aplications/new
  def new
    @job_aplication = JobAplication.new

    if params[:job_id].nil?
      flash[:alert] = "From where did you come from?!"
      redirect_to jobs_path
    else
      if user_signed_in?
        @job = Job.find(params[:job_id])
      else
        flash[:alert] = "Please sign in first"
        redirect_to user_session_path
      end
    end
  end


  # GET /job_aplications/1/edit
  def edit
  end

  # POST /job_aplications
  # POST /job_aplications.json
  def create
    @job_aplication = JobAplication.new(job_aplication_params)

    respond_to do |format|
      if @job_aplication.save
        format.html { redirect_to jobs_path, notice: 'Job aplication was successfully created.' }
        format.json { redirect_to jobs_path, status: :created, location: @job_aplication }
      else
        format.html { render :new }
        format.json { render json: @job_aplication.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /job_aplications/1
  # PATCH/PUT /job_aplications/1.json
  def update
    respond_to do |format|
      if @job_aplication.update(job_aplication_params)
        format.html { redirect_to @job_aplication, notice: 'Job aplication was successfully updated.' }
        format.json { render :show, status: :ok, location: @job_aplication }
      else
        format.html { render :edit }
        format.json { render json: @job_aplication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_aplications/1
  # DELETE /job_aplications/1.json
  def destroy
    @job_aplication.destroy
    respond_to do |format|
      format.html { redirect_to job_aplications_url, notice: 'Job aplication was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_aplication
      @job_aplication = JobAplication.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def job_aplication_params
      params.require(:job_aplication).permit(:name, :date_of_birth, :email, :phone_num, :address, :education, :job_id)
    end
end
