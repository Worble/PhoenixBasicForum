defmodule October2017.Threads.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias October2017.Threads.Post
  alias October2017.Threads.Thread

  schema "posts" do
    field :content, :string
    belongs_to :thread, Thread

    timestamps()
  end

  @doc false
  def changeset(%Post{} = post, attrs) do
    post
    |> cast(attrs, [:content, :thread_id])
    |> validate_required([:content, :thread_id])
    |> foreign_key_constraint(:thread_id)
  end
end
