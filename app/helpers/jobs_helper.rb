module JobsHelper
  def sf(job)
    simple_format(job.description)
  end
end
