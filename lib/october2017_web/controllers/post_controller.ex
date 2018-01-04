defmodule October2017Web.PostController do
  use October2017Web, :controller

  alias October2017.Threads
  alias October2017.Threads.Post

  plug :assign_thread
  plug :scrub_params, "post" when action in [:create]

  def new(conn, _params) do
    changeset = Threads.change_post(%Post{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"post" => post_params}) do
    case Threads.create_post(post_params, conn.assigns[:thread]) do
      {:ok, _} ->
        conn
        |> put_flash(:info, "Post created successfully.")
        |> redirect(to: thread_path(conn, :show, conn.assigns[:thread]))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  defp assign_thread(conn, _opts) do
    case conn.params do
      %{"thread_id" => thread_id} ->
        thread = Threads.get_thread!(thread_id)
        assign(conn, :thread, thread)
      _ ->
        conn
    end
  end
end

