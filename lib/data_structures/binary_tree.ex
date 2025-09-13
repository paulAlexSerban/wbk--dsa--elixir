defmodule ElixirDsa.DataStructures.BinaryTree do
  @moduledoc """
  A simple binary tree implementation.
  """

  defstruct [:value, :left, :right]

  @doc """
  Creates a new leaf node.
  
  ## Examples
  
      iex> ElixirDsa.DataStructures.BinaryTree.leaf(5)
      %ElixirDsa.DataStructures.BinaryTree{value: 5, left: nil, right: nil}
  """
  def leaf(value) do
    %__MODULE__{value: value, left: nil, right: nil}
  end

  @doc """
  Creates a new node with left and right children.
  """
  def node(value, left, right) do
    %__MODULE__{value: value, left: left, right: right}
  end

  @doc """
  Inserts a value into a binary search tree.
  
  ## Examples
  
      iex> tree = ElixirDsa.DataStructures.BinaryTree.leaf(5)
      iex> tree = ElixirDsa.DataStructures.BinaryTree.insert(tree, 3)
      iex> tree = ElixirDsa.DataStructures.BinaryTree.insert(tree, 7)
      iex> tree.left.value
      3
      iex> tree.right.value
      7
  """
  def insert(nil, value), do: leaf(value)
  
  def insert(%__MODULE__{value: node_value, left: left, right: right} = node, value) do
    cond do
      value < node_value ->
        %{node | left: insert(left, value)}
      value > node_value ->
        %{node | right: insert(right, value)}
      true ->
        node  # Value already exists
    end
  end

  @doc """
  Searches for a value in the binary search tree.
  """
  def search(nil, _), do: false
  def search(%__MODULE__{value: value}, value), do: true
  def search(%__MODULE__{value: node_value, left: left}, value) when value < node_value do
    search(left, value)
  end
  def search(%__MODULE__{value: node_value, right: right}, value) when value > node_value do
    search(right, value)
  end

  @doc """
  Performs in-order traversal of the tree.
  """
  def in_order(nil), do: []
  def in_order(%__MODULE__{value: value, left: left, right: right}) do
    in_order(left) ++ [value] ++ in_order(right)
  end

  @doc """
  Performs pre-order traversal of the tree.
  """
  def pre_order(nil), do: []
  def pre_order(%__MODULE__{value: value, left: left, right: right}) do
    [value] ++ pre_order(left) ++ pre_order(right)
  end

  @doc """
  Performs post-order traversal of the tree.
  """
  def post_order(nil), do: []
  def post_order(%__MODULE__{value: value, left: left, right: right}) do
    post_order(left) ++ post_order(right) ++ [value]
  end
end