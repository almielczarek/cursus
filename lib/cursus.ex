defmodule Cursus do
  @moduledoc """
  Documentation for Cursus.
  """

  alias Cursus.Repo

  alias Cursus.Board
  alias Cursus.List
  alias Cursus.Item

  import Ecto.Query

  def get_board_preloaded(id) do
    Board
    |> Repo.get(id)
    |> Repo.preload(lists: [items: from(i in Item, order_by: i.index)])
  end

  def create_board(params) do
    %Board{}
    |> Board.changeset(params)
    |> Repo.insert()
  end

  def create_list(board, params) do
    %List{}
    |> List.new_changeset(board, params)
    |> Repo.insert()
  end

  def create_item(list, params) do
    list = Repo.preload(list, :items)

    index = Enum.max(Enum.map(list.items, fn item -> item.index + 1 end), fn -> 0 end)

    %Item{}
    |> Item.new_changeset(list, Map.put(params, :index, index))
    |> Repo.insert()
  end

  def update_item(item, params) do
    item
    |> Item.changeset(params)
    |> Repo.update()
  end

  def move_item(item, to_list, to_index) do
    item = Repo.preload(item, :list)

    changeset =
      item
      |> Item.changeset(%{list_id: to_list.id})
      |> Ecto.Changeset.force_change(:index, to_index)

    Ecto.Multi.new()
    |> Ecto.Multi.update_all(
      :source_list_update,
      from(i in Item, where: i.list_id == ^item.list_id and i.index >= ^item.index),
      inc: [index: -1]
    )
    |> Ecto.Multi.update_all(
      :target_list_update,
      from(i in Item, where: i.list_id == ^to_list.id and i.index >= ^to_index),
      inc: [index: 1]
    )
    |> Ecto.Multi.update(:item, changeset)
    |> Repo.transaction()
  end
end
