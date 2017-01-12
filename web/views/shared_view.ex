defmodule VerkWeb.SharedView do
  use VerkWeb.Web, :view

  def enqueued_at(nil), do: "N/A"
  def enqueued_at(timestamp) do
    timestamp |> Calendar.DateTime.Parse.unix! |> Calendar.DateTime.Format.rfc3339
  end
end
