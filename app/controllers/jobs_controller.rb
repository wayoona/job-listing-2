class JobsController < ApplicationController
  before_action :authenticate_user!, only:[:new,:edit,:destroy,:create,:update]

  def index
    @jobs = Job.where(:is_hidden => false).order("created_at DESC")
  end

  def show
    @job = Job.find(params[:id])
    if @job.is_hidden
      flash[:warning] = "This Job already archived"
      redirect_to jobs_path
    end
  end

  def new
    @job = Job.new
  end

  def edit
    @job = Job.find(params[:id])
  end

  def create
    @job = Job.new(job_params)

    if @job.save
      redirect_to jobs_path
    else
      render :new
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to jobs_path
  end

  private
  def job_params
    params.require(:job).permit(:title, :description,:up_bound,:dw_bound,:is_hidden)
  end



end
