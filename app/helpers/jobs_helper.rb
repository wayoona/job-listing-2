module JobsHelper
  def sf(job)
    simple_format(job.description)
  end


  def render_job_status(job)
  if job.is_hidden
      content_tag(:span, "", :class => "fa fa-lock")
    else
      content_tag(:span, "", :class => "fa fa-globe")
    end
  end

end
