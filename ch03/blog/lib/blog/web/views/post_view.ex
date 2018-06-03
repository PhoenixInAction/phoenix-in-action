defmodule Blog.Web.PostView do
  use Blog.Web, :view

  def date(date_to_display) do
    Date.to_string(date_to_display)
  end
end
