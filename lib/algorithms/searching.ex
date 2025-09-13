defmodule ElixirDsa.Algorithms.Searching do
  @moduledoc """
  Common searching algorithm implementations.
  """

  @doc """
  Linear search implementation.
  
  ## Examples
  
      iex> ElixirDsa.Algorithms.Searching.linear_search([1, 3, 5, 7, 9], 5)
      {:found, 2}
      
      iex> ElixirDsa.Algorithms.Searching.linear_search([1, 3, 5, 7, 9], 4)
      :not_found
  """
  def linear_search(list, target) do
    linear_search(list, target, 0)
  end

  defp linear_search([], _, _), do: :not_found
  defp linear_search([target | _], target, index), do: {:found, index}
  defp linear_search([_ | tail], target, index) do
    linear_search(tail, target, index + 1)
  end

  @doc """
  Binary search implementation (requires sorted list).
  
  ## Examples
  
      iex> ElixirDsa.Algorithms.Searching.binary_search([1, 3, 5, 7, 9], 5)
      {:found, 2}
      
      iex> ElixirDsa.Algorithms.Searching.binary_search([1, 3, 5, 7, 9], 4)
      :not_found
  """
  def binary_search(list, target) do
    binary_search(list, target, 0, length(list) - 1)
  end

  defp binary_search(_, _, low, high) when low > high, do: :not_found
  defp binary_search(list, target, low, high) do
    mid = div(low + high, 2)
    mid_value = Enum.at(list, mid)

    cond do
      mid_value == target -> {:found, mid}
      mid_value > target -> binary_search(list, target, low, mid - 1)
      mid_value < target -> binary_search(list, target, mid + 1, high)
    end
  end

  @doc """
  Depth-First Search for trees/graphs.
  
  ## Examples
  
      iex> tree = %{value: 1, children: [%{value: 2, children: []}, %{value: 3, children: []}]}
      iex> ElixirDsa.Algorithms.Searching.dfs(tree, 2)
      true
  """
  def dfs(nil, _), do: false
  def dfs(%{value: target}, target), do: true
  def dfs(%{value: _, children: children}, target) do
    Enum.any?(children, &dfs(&1, target))
  end

  @doc """
  Breadth-First Search for trees/graphs.
  """
  def bfs(root, target) do
    bfs_queue([root], target)
  end

  defp bfs_queue([], _), do: false
  defp bfs_queue([nil | queue], target), do: bfs_queue(queue, target)
  defp bfs_queue([%{value: target} | _], target), do: true
  defp bfs_queue([%{value: _, children: children} | queue], target) do
    bfs_queue(queue ++ children, target)
  end
end