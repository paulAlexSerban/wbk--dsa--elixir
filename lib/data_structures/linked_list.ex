defmodule ElixirDsa.DataStructures.LinkedList do
  @moduledoc """
  A simple implementation of a linked list data structure.
  """

  defstruct [:head]

  @doc """
  Creates a new empty linked list.
  
  ## Examples
  
      iex> ElixirDsa.DataStructures.LinkedList.new()
      %ElixirDsa.DataStructures.LinkedList{head: nil}
  """
  def new do
    %__MODULE__{head: nil}
  end

  @doc """
  Prepends an element to the front of the list.
  
  ## Examples
  
      iex> list = ElixirDsa.DataStructures.LinkedList.new()
      iex> list = ElixirDsa.DataStructures.LinkedList.prepend(list, 1)
      iex> list.head.data
      1
  """
  def prepend(%__MODULE__{head: head}, data) do
    new_node = %{data: data, next: head}
    %__MODULE__{head: new_node}
  end

  @doc """
  Returns the size of the linked list.
  
  ## Examples
  
      iex> list = ElixirDsa.DataStructures.LinkedList.new()
      iex> list = ElixirDsa.DataStructures.LinkedList.prepend(list, 1)
      iex> list = ElixirDsa.DataStructures.LinkedList.prepend(list, 2)
      iex> ElixirDsa.DataStructures.LinkedList.size(list)
      2
  """
  def size(%__MODULE__{head: nil}), do: 0
  def size(%__MODULE__{head: head}), do: size_helper(head, 0)

  defp size_helper(nil, acc), do: acc
  defp size_helper(%{next: next}, acc), do: size_helper(next, acc + 1)

  @doc """
  Converts the linked list to a regular Elixir list.
  
  ## Examples
  
      iex> list = ElixirDsa.DataStructures.LinkedList.new()
      iex> list = ElixirDsa.DataStructures.LinkedList.prepend(list, 1)
      iex> list = ElixirDsa.DataStructures.LinkedList.prepend(list, 2)
      iex> ElixirDsa.DataStructures.LinkedList.to_list(list)
      [2, 1]
  """
  def to_list(%__MODULE__{head: nil}), do: []
  def to_list(%__MODULE__{head: head}), do: to_list_helper(head, [])

  defp to_list_helper(nil, acc), do: Enum.reverse(acc)
  defp to_list_helper(%{data: data, next: next}, acc) do
    to_list_helper(next, [data | acc])
  end

  @doc """
  Finds an element in the linked list.
  """
  def find(%__MODULE__{head: nil}, _), do: false
  def find(%__MODULE__{head: head}, target), do: find_helper(head, target)

  defp find_helper(nil, _), do: false
  defp find_helper(%{data: data}, target) when data == target, do: true
  defp find_helper(%{next: next}, target), do: find_helper(next, target)
end