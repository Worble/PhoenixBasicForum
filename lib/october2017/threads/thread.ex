defmodule October2017.Threads.Thread do
  use Ecto.Schema
  import Ecto.Changeset
  alias October2017.Threads.Thread
  alias October2017.Threads.Post

  schema "threads" do
    has_many :posts, Post
    
    timestamps()
  end

  @doc false
  def changeset(%Thread{} = thread, attrs) do
    thread
    |> cast(attrs, [])
    |> validate_required([])
  end
end
