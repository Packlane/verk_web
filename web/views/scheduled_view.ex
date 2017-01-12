defmodule VerkWeb.ScheduledView do
  use VerkWeb.Web, :view

  def scheduled_jobs(jobs) do
    Enum.map jobs, fn {job, perform_at} ->
      %{
        perform_at: Calendar.DateTime.Parse.unix!(perform_at),
        queue: job.queue,
        jid: job.jid,
        class: job.class,
        args: job.args |> inspect,
        job: job
      }
    end
  end

  def perform_at(datetime) do
    Calendar.DateTime.Format.rfc3339(datetime)
  end
end
