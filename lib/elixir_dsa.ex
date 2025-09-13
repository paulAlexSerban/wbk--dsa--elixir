defmodule ElixirDsa do
  @moduledoc """
  ElixirDsa - A comprehensive learning repository for Elixir programming language.
  
  This module serves as the main entry point for exploring:
  - Basic Elixir concepts
  - Intermediate concepts  
  - Advanced concepts
  - Data structures implementations
  - Algorithm implementations
  """

  @doc """
  Displays a welcome message and learning path.
  """
  def welcome do
    IO.puts("""
    Welcome to Elixir DSA Learning Repository!
    
    Learning Path:
    1. Basics - Pattern matching, functions, processes
    2. Intermediate - GenServer, OTP, supervision trees  
    3. Advanced - Distributed systems, metaprogramming
    4. Data Structures - Lists, maps, trees, graphs
    5. Algorithms - Sorting, searching, dynamic programming
    
    Use the modules in each category to explore concepts and run examples.
    """)
  end
end