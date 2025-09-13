defmodule ElixirDsa.Basics.PatternMatchingTest do
  use ExUnit.Case
  doctest ElixirDsa.Basics.PatternMatching

  alias ElixirDsa.Basics.PatternMatching

  test "match_tuple with success result" do
    assert PatternMatching.match_tuple({:ok, "data"}) == "Operation successful: data"
  end

  test "match_tuple with error result" do
    assert PatternMatching.match_tuple({:error, "failed"}) == "Operation failed: failed"
  end

  test "match_tuple with unknown result" do
    assert PatternMatching.match_tuple({:unknown, "test"}) == "Unknown result"
  end

  test "process_list with non-empty list" do
    assert PatternMatching.process_list([1, 2, 3]) == "Head: 1, Tail: [2, 3]"
  end

  test "process_list with empty list" do
    assert PatternMatching.process_list([]) == "Empty list"
  end

  test "categorize_number with small positive" do
    assert PatternMatching.categorize_number(5) == "Small positive number"
  end

  test "categorize_number with large positive" do
    assert PatternMatching.categorize_number(15) == "Large positive number"
  end

  test "categorize_number with negative" do
    assert PatternMatching.categorize_number(-3) == "Negative number"
  end

  test "categorize_number with zero" do
    assert PatternMatching.categorize_number(0) == "Zero"
  end
end