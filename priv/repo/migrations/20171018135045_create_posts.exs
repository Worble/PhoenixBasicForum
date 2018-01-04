defmodule October2017.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :content, :string
      add :thread_id, references(:threads)

      timestamps()
    end

  end
end