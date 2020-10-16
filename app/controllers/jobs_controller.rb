class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json
  # GET /jobs
  # GET /jobs.json
  def index
    @jobs = Job.all
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
  end

  # GET /jobs/new
  def new
    @job = Job.new
    respond_to do |format|
      format.html
      format.js
    end 
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  # POST /jobs.json
  def create
    if isEmployer?
    @job = Job.new(job_params)
      @job.user_id = current_user.id
      respond_to do |format|
        if @job.save
          format.html { redirect_to @job, notice: 'Job was successfully created.' }
          format.json { render :show, status: :created, location: @job }
          format.js   { render :index, status: :created, location: @job }
        else
          format.html { render :new }
          format.json { render json: @job.errors, status: :unprocessable_entity }
          format.js   { render json: @job.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    if isEmployer?
      respond_to do |format|
        if @job.update(job_params)
          format.html { redirect_to @job, notice: 'Job was successfully updated.' }
          format.json { render :show, status: :ok, location: @job }
        else
          format.html { render :edit }
          format.json { render json: @job.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    if isEmployer?
          @job.destroy
      respond_to do |format|
        format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end



  private


  def isEmployer?
    if user_signed_in? 
      if current_user.employer
        true
      else 
        flash[:alert] = "Unsufficient rights!"
        redirect_to jobs_path
        false
      end
    else
      flash[:alert] = "You need to sign in first!"
      redirect_to user_session_path
      false
    end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def job_params
      params.require(:job).permit(:name, :description, :category, :expiration_date)
    end
end
