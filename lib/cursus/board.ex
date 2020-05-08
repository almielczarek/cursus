defmodule Cursus.Board do
  use Rw.Schema

  alias Cursus.List

  import Ecto.Changeset

  schema "cursus_boards" do
    field(:name, :string)

    has_many(:lists, List)

    timestamps()
  end

  def changeset(board, params) do
    board
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
