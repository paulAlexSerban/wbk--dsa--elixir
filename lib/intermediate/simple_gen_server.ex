defmodule ElixirDsa.Intermediate.SimpleGenServer do
  @moduledoc """
  A simple GenServer example demonstrating OTP behavior.
  
  GenServer provides a standard way to build stateful processes.
  """
  
  use GenServer

  ## Client API

  @doc """
  Starts the GenServer.
  
  ## Examples
  
      iex> {:ok, pid} = ElixirDsa.Intermediate.SimpleGenServer.start_link([])
      iex> is_pid(pid)
      true
  """
  def start_link(opts) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  @doc """
  Adds an item to the stack.
  """
  def push(server, item) do
    GenServer.cast(server, {:push, item})
  end

  @doc """
  Removes and returns the top item from the stack.
  """
  def pop(server) do
    GenServer.call(server, :pop)
  end

  @doc """
  Returns the current stack without modifying it.
  """
  def peek(server) do
    GenServer.call(server, :peek)
  end

  ## Server Callbacks

  @impl true
  def init(:ok) do
    {:ok, []}
  end

  @impl true
  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end

  @impl true
  def handle_call(:pop, _from, []) do
    {:reply, nil, []}
  end

  @impl true
  def handle_call(:peek, _from, state) do
    {:reply, state, state}
  end

  @impl true
  def handle_cast({:push, item}, state) do
    {:noreply, [item | state]}
  end
end