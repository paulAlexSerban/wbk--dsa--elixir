defmodule ElixirDsaTest do
  use ExUnit.Case
  doctest ElixirDsa

  test "welcome message" do
    import ExUnit.CaptureIO
    
    output = capture_io(fn ->
      ElixirDsa.welcome()
    end)
    
    assert String.contains?(output, "Welcome to Elixir DSA Learning Repository!")
    assert String.contains?(output, "Learning Path:")
  end
end