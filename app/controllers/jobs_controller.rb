class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  
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
    if isEmployer?
      @job = Job.new
    end
  end


  # GET /jobs/1/edit
  def edit
    if isEmployer?
      respond_to do |format|
        format.html
        format.js
      end
    end
  end


  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(job_params)
    @job.user_id = current_user.id
    if @job.save
      flash[:success] = "Your job post has been saved!"
      redirect_to jobs_path
    else
      flash[:alert] = "Something went wrong! Your job post has not been saved."
      redirect_to jobs_path
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    if isEmployer?
      if @job.user_id == current_user.id
        respond_to do |format|
          if @job.update(job_params)
            format.html { redirect_to jobs_url, notice: 'Job was successfully updated.' }
            format.json { render :show, status: :ok, location: @job }
          else
            format.html { redirect_to jobs_url }
            format.json { render json: @job.errors, status: :unprocessable_entity }
          end
        end
      else 
        flash[:alert] = "You can only edit your post"
        redirect_to jobs_path
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    if isEmployer? && @job.user_id == current_user.id
          @job.destroy
      respond_to do |format|
        format.html { redirect_to jobs_url, notice: 'Job post was successfully deleted.' }
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
