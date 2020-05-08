defmodule Cursus.Repo.Migrations.CreateCursus do
  use Ecto.Migration

  def change do
    create table(:cursus_boards) do
      add(:name, :string)
      timestamps()
    end

    create table(:cursus_lists) do
      add(:name, :string)
      add(:board_id, references(:cursus_boards))
      timestamps()
    end

    create table(:cursus_items) do
      add(:name, :string)
      add(:index, :integer)
      add(:list_id, references(:cursus_lists))
      timestamps()
    end
  end
end
