class Admin::JobsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :update, :destroy ,:edit]
  before_action :admin_is_required


  def new
    @job = Job.new
  end

  def index
    @jobs = Job.all
  end

  def create
    @job = Job.new(job_params)
    if @job.save
    redirect_to admin_jobs_path
  else
    render :new
  end

  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to admin_jobs_path, notice: "update succeed"
    else
      render :edit
    end
  end

    def edit
      @job = Job.find(params[:id])
    end

    def show
      @job = Job.find(params[:id])
    end

    def destroy
      @job = Job.find(params[:id])
      @job.destroy
      redirect_to admin_jobs_path
    end

    private
    def job_params
      params.require(:job).permit(:title,:description,:up_bound,:dw_bound,:is_hidden)
    end




end
