defmodule Cursus.Item do
  use Rw.Schema

  alias Cursus.List

  import Ecto.Changeset

  schema "cursus_items" do
    field(:name, :string)
    field(:index, :integer)

    belongs_to(:list, List)
    timestamps()
  end

  def new_changeset(item, list, params) do
    item
    |> cast(params, [:name, :index])
    |> validate_required([:name, :index])
    |> put_assoc(:list, list)
  end

  def changeset(item, params) do
    item
    |> cast(params, [:name, :index, :list_id])
    |> validate_required([:name, :index, :list_id])
  end
end
