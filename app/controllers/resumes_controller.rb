class ResumesController < ApplicationController

  def new
    @job = Job.find(params[:job_id])
    @resume = Resume.new
  end

  def create
    @job = Job.find(params[:job_id])
    @resume = Resume.new(params_resume)
    @resume.user = current_user
    @resume.job = @job
    if @resume.save
      redirect_to job_path(@job), notice: "简历提交成功"
    else
      render :new
    end
  end

  private
  def params_resume
  params.require(:resume).permit(:content,:attachment)
  end

end
