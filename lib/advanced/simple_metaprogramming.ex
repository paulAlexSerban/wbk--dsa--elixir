defmodule ElixirDsa.Advanced.SimpleMetaprogramming do
  @moduledoc """
  Basic metaprogramming examples in Elixir.
  
  Metaprogramming allows you to write code that writes code.
  """

  @doc """
  A macro that creates getter and setter functions.
  """
  defmacro create_property(name) do
    quote do
      def unquote(:"get_#{name}")() do
        Agent.get(__MODULE__, &Map.get(&1, unquote(name)))
      end

      def unquote(:"set_#{name}")(value) do
        Agent.update(__MODULE__, &Map.put(&1, unquote(name), value))
      end
    end
  end

  @doc """
  A macro that defines multiple functions with similar patterns.
  """
  defmacro define_math_functions do
    quote do
      def add(a, b), do: a + b
      def subtract(a, b), do: a - b  
      def multiply(a, b), do: a * b
      def divide(a, b) when b != 0, do: a / b
      def divide(_, 0), do: {:error, "Division by zero"}
    end
  end

  @doc """
  Demonstrates compile-time code generation.
  """
  defmacro generate_fibonacci_function(n) when is_integer(n) and n > 0 do
    fib_values = generate_fibonacci_list(n)
    
    clauses = for {index, value} <- Enum.with_index(fib_values) do
      quote do
        def fibonacci(unquote(index)), do: unquote(value)
      end
    end
    
    quote do
      unquote(clauses)
      def fibonacci(_), do: {:error, "Not precomputed"}
    end
  end

  defp generate_fibonacci_list(n) do
    Stream.unfold({0, 1}, fn {a, b} -> {a, {b, a + b}} end)
    |> Enum.take(n)
  end
end