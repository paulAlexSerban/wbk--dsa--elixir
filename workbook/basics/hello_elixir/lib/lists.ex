defmodule Lists do
  def create_list do
    ["apple", "banana", "cherry"]
  end

  def add_element(list, element) do
    list ++ [element]
  end

  def get_first_element([head | _tail]) do
    head
  end
end
