defmodule ElixirDsa.Basics.PatternMatching do
  @moduledoc """
  Pattern Matching examples and exercises.
  
  Pattern matching is one of Elixir's most powerful features.
  """

  @doc """
  Basic pattern matching with tuples.
  
  ## Examples
  
      iex> ElixirDsa.Basics.PatternMatching.match_tuple({:ok, "success"})
      "Operation successful: success"
      
      iex> ElixirDsa.Basics.PatternMatching.match_tuple({:error, "failed"})
      "Operation failed: failed"
  """
  def match_tuple({:ok, message}), do: "Operation successful: #{message}"
  def match_tuple({:error, message}), do: "Operation failed: #{message}"
  def match_tuple(_), do: "Unknown result"

  @doc """
  Pattern matching with lists.
  
  ## Examples
  
      iex> ElixirDsa.Basics.PatternMatching.process_list([1, 2, 3])
      "Head: 1, Tail: [2, 3]"
      
      iex> ElixirDsa.Basics.PatternMatching.process_list([])
      "Empty list"
  """
  def process_list([]), do: "Empty list"
  def process_list([head | tail]), do: "Head: #{head}, Tail: #{inspect(tail)}"

  @doc """
  Pattern matching with guards.
  
  ## Examples
  
      iex> ElixirDsa.Basics.PatternMatching.categorize_number(5)
      "Small positive number"
      
      iex> ElixirDsa.Basics.PatternMatching.categorize_number(-3)
      "Negative number"
      
      iex> ElixirDsa.Basics.PatternMatching.categorize_number(15)
      "Large positive number"
  """
  def categorize_number(n) when n > 0 and n < 10, do: "Small positive number"
  def categorize_number(n) when n >= 10, do: "Large positive number"
  def categorize_number(n) when n < 0, do: "Negative number"
  def categorize_number(0), do: "Zero"
end