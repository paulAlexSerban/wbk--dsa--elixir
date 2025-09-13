defmodule ElixirDsa.Algorithms.SortingTest do
  use ExUnit.Case
  doctest ElixirDsa.Algorithms.Sorting

  alias ElixirDsa.Algorithms.Sorting

  @test_data [64, 34, 25, 12, 22, 11, 90]
  @expected [11, 12, 22, 25, 34, 64, 90]

  test "bubble_sort sorts correctly" do
    assert Sorting.bubble_sort(@test_data) == @expected
    assert Sorting.bubble_sort([]) == []
    assert Sorting.bubble_sort([1]) == [1]
  end

  test "quick_sort sorts correctly" do
    assert Sorting.quick_sort(@test_data) == @expected
    assert Sorting.quick_sort([]) == []
    assert Sorting.quick_sort([1]) == [1]
  end

  test "merge_sort sorts correctly" do
    assert Sorting.merge_sort(@test_data) == @expected
    assert Sorting.merge_sort([]) == []
    assert Sorting.merge_sort([1]) == [1]
  end

  test "insertion_sort sorts correctly" do
    assert Sorting.insertion_sort(@test_data) == @expected
    assert Sorting.insertion_sort([]) == []
    assert Sorting.insertion_sort([1]) == [1]
  end

  test "all sorting algorithms produce same result" do
    results = [
      Sorting.bubble_sort(@test_data),
      Sorting.quick_sort(@test_data),
      Sorting.merge_sort(@test_data),
      Sorting.insertion_sort(@test_data)
    ]

    assert Enum.all?(results, &(&1 == @expected))
  end
end