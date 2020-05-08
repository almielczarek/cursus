defmodule Cursus.List do
  use Rw.Schema

  alias Cursus.Board
  alias Cursus.Item

  import Ecto.Changeset

  schema "cursus_lists" do
    field(:name, :string)

    belongs_to(:board, Board)
    has_many(:items, Item)

    timestamps()
  end

  def new_changeset(list, board, params) do
    list
    |> cast(params, [:name])
    |> validate_required([:name])
    |> put_assoc(:board, board)
  end
end
