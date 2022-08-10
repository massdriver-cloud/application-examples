defmodule K8sElixirPostgresWeb.PageController do
  use K8sElixirPostgresWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
