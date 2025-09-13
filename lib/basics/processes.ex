defmodule ElixirDsa.Basics.Processes do
  @moduledoc """
  Basic process examples demonstrating Elixir's actor model.
  
  Processes are lightweight and isolated units of computation.
  """

  @doc """
  Creates a simple process that echoes messages.
  
  ## Examples
  
      iex> pid = ElixirDsa.Basics.Processes.start_echo_process()
      iex> send(pid, {:echo, "hello"})
      iex> Process.alive?(pid)
      true
  """
  def start_echo_process do
    spawn(fn -> echo_loop() end)
  end

  defp echo_loop do
    receive do
      {:echo, message} ->
        IO.puts("Echo: #{message}")
        echo_loop()
      
      :stop ->
        IO.puts("Echo process stopping")
        
      _ ->
        IO.puts("Unknown message")
        echo_loop()
    end
  end

  @doc """
  Creates a counter process that maintains state.
  
  ## Examples
  
      iex> pid = ElixirDsa.Basics.Processes.start_counter(0)
      iex> send(pid, {:increment, self()})
      iex> receive do {:count, count} -> count end
      1
  """
  def start_counter(initial_count) do
    spawn(fn -> counter_loop(initial_count) end)
  end

  defp counter_loop(count) do
    receive do
      {:increment, caller} ->
        new_count = count + 1
        send(caller, {:count, new_count})
        counter_loop(new_count)
        
      {:decrement, caller} ->
        new_count = count - 1
        send(caller, {:count, new_count})
        counter_loop(new_count)
        
      {:get, caller} ->
        send(caller, {:count, count})
        counter_loop(count)
        
      :stop ->
        IO.puts("Counter process stopping")
    end
  end

  @doc """
  Demonstrates message passing between processes.
  """
  def message_passing_demo do
    parent = self()
    
    child = spawn(fn ->
      receive do
        {:hello, from} ->
          send(from, {:reply, "Hello from child process!"})
      end
    end)
    
    send(child, {:hello, parent})
    
    receive do
      {:reply, message} ->
        IO.puts("Received: #{message}")
    end
  end
end