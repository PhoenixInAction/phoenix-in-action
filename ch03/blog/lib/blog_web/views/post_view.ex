defmodule BlogWeb.PostView do
  use BlogWeb, :view

  def date(date_to_display), do: Date.to_string(date_to_display)
end
