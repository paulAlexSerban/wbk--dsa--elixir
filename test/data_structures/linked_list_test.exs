defmodule ElixirDsa.DataStructures.LinkedListTest do
  use ExUnit.Case
  doctest ElixirDsa.DataStructures.LinkedList

  alias ElixirDsa.DataStructures.LinkedList

  test "new creates empty list" do
    list = LinkedList.new()
    assert list.head == nil
  end

  test "prepend adds elements to front" do
    list = LinkedList.new()
    |> LinkedList.prepend(1)
    |> LinkedList.prepend(2)
    |> LinkedList.prepend(3)

    assert list.head.data == 3
    assert list.head.next.data == 2
    assert list.head.next.next.data == 1
  end

  test "size returns correct count" do
    list = LinkedList.new()
    assert LinkedList.size(list) == 0

    list = LinkedList.prepend(list, 1)
    assert LinkedList.size(list) == 1

    list = LinkedList.prepend(list, 2)
    assert LinkedList.size(list) == 2
  end

  test "to_list converts to Elixir list" do
    list = LinkedList.new()
    |> LinkedList.prepend(1)
    |> LinkedList.prepend(2)
    |> LinkedList.prepend(3)

    assert LinkedList.to_list(list) == [3, 2, 1]
  end

  test "find locates existing elements" do
    list = LinkedList.new()
    |> LinkedList.prepend(1)
    |> LinkedList.prepend(2)
    |> LinkedList.prepend(3)

    assert LinkedList.find(list, 2) == true
    assert LinkedList.find(list, 5) == false
  end
end