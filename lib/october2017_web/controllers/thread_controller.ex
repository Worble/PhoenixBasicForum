defmodule October2017Web.ThreadController do
  use October2017Web, :controller

  alias October2017.Threads
  alias October2017.Threads.Post

  plug :scrub_params, "post" when action in [:create]

  def index(conn, _params) do
    threads = Threads.list_threads()
    render(conn, "index.html", threads: threads)
  end

  def new(conn, _params) do
    changeset = Threads.change_post(%Post{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"post" => thread_params}) do
    case Threads.create_thread(thread_params) do
      {:ok, thread} ->
        conn
        |> put_flash(:info, "Thread created successfully.")
        |> redirect(to: thread_path(conn, :show, thread))
      {:error, {:error, %Ecto.Changeset{} = changeset}} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    thread = Threads.get_thread!(id)
    render(conn, "show.html", thread: thread)
  end
end
