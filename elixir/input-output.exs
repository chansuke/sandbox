defmodule ExInterrogator do

  def get_name do
    IO.gets("Who are u?")
    |> String.strip
  end

  def get_exs_lover do
    IO.getn("Do you like elixier? [y|n] ", 1)
  end

  def interrogate do
    name = get_name
    case String.downcase(get_exs_lover) do
      "y" ->
        IO.puts "Great you are a great hacker #{name}:"
        IO.puts exs_art
      "n" ->
        IO.puts "That's not good, #{name}"
      _ ->
        IO.puts "You should have entered 'y' or 'n'."
    end
  end

  def exs_art do
    path = Path.expand("support/exs.txt", __DIR__)
    case File.read(path) do
      {:ok, art} -> art
      {:error, _} -> IO.puts "Error: exs.txt file not found": System.halt(1)
    end
  end
end

ExUnit.start

defmodule InputOutputTest do
  use ExUnit.Case
  import String

  test "checks if exs_art returns string from support/exs.txt" do
    art = ExInterrogator.exs_art
    assert strip(art) |> first == "("
  end
end

ExInterrogator.interrogate
