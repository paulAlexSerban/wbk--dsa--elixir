defmodule ElixirDsa.Algorithms.Sorting do
  @moduledoc """
  Common sorting algorithm implementations.
  """

  @doc """
  Bubble sort implementation.
  
  ## Examples
  
      iex> ElixirDsa.Algorithms.Sorting.bubble_sort([64, 34, 25, 12, 22, 11, 90])
      [11, 12, 22, 25, 34, 64, 90]
  """
  def bubble_sort(list) when is_list(list) do
    bubble_sort(list, length(list))
  end

  defp bubble_sort(list, 0), do: list
  defp bubble_sort(list, n) do
    new_list = bubble_pass(list, [])
    bubble_sort(new_list, n - 1)
  end

  defp bubble_pass([], acc), do: Enum.reverse(acc)
  defp bubble_pass([x], acc), do: Enum.reverse([x | acc])
  defp bubble_pass([x, y | rest], acc) when x > y do
    bubble_pass([x | rest], [y | acc])
  end
  defp bubble_pass([x, y | rest], acc) do
    bubble_pass([y | rest], [x | acc])
  end

  @doc """
  Quick sort implementation.
  
  ## Examples
  
      iex> ElixirDsa.Algorithms.Sorting.quick_sort([64, 34, 25, 12, 22, 11, 90])
      [11, 12, 22, 25, 34, 64, 90]
  """
  def quick_sort([]), do: []
  def quick_sort([pivot | tail]) do
    {smaller, larger} = Enum.split_with(tail, &(&1 <= pivot))
    quick_sort(smaller) ++ [pivot] ++ quick_sort(larger)
  end

  @doc """
  Merge sort implementation.
  
  ## Examples
  
      iex> ElixirDsa.Algorithms.Sorting.merge_sort([64, 34, 25, 12, 22, 11, 90])
      [11, 12, 22, 25, 34, 64, 90]
  """
  def merge_sort([]), do: []
  def merge_sort([x]), do: [x]
  def merge_sort(list) do
    {left, right} = Enum.split(list, div(length(list), 2))
    merge(merge_sort(left), merge_sort(right))
  end

  defp merge([], right), do: right
  defp merge(left, []), do: left
  defp merge([h1 | t1], [h2 | t2]) when h1 <= h2 do
    [h1 | merge(t1, [h2 | t2])]
  end
  defp merge([h1 | t1], [h2 | t2]) do
    [h2 | merge([h1 | t1], t2)]
  end

  @doc """
  Insertion sort implementation.
  
  ## Examples
  
      iex> ElixirDsa.Algorithms.Sorting.insertion_sort([64, 34, 25, 12, 22, 11, 90])
      [11, 12, 22, 25, 34, 64, 90]
  """
  def insertion_sort(list), do: insertion_sort(list, [])

  defp insertion_sort([], acc), do: acc
  defp insertion_sort([head | tail], acc) do
    insertion_sort(tail, insert_sorted(head, acc))
  end

  defp insert_sorted(x, []), do: [x]
  defp insert_sorted(x, [head | tail]) when x <= head, do: [x, head | tail]
  defp insert_sorted(x, [head | tail]), do: [head | insert_sorted(x, tail)]
end