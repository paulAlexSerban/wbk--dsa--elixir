defmodule Strings do
  @moduledoc """
  Documentation for `Strings`.
  """

  @doc """
  Concatenates two strings.

  ## Examples

      iex> Strings.concatenate("Hello, ", "world!")
      "Hello, world!"

  """
  def concatenate(str1, str2) do
    str1 <> str2
  end
end
