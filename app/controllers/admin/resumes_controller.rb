class Admin::ResumesController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_is_required

  layout 'admin'


  def index
    @job = Job.find(params[:job_id])
    @resumes = @job.resumes.recent
  end
end
