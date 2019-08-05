defmodule Identicon do
  @moduledoc """
  Documentation for Identicon.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Identicon.hello()
      :world

  """
  def hello do
    :world
  end

  def main(input) do
    input
    |> hash_input
    |> pick_color
    |> build_grid
  end

  @doc """
  Takes input string, generates a list of 16 numbers

  ## Examples:
    Identicon.hash_input("banana")
    %Identicon.Image { hex: [114, 179, 2, 191, 41, 122, 34, 138, 117, 115, 1, 35, 239, 239, 124, 65] }
  """
  def hash_input(input) do
    hex =
      :crypto.hash(:md5, input)
      |> :binary.bin_to_list()

    %Identicon.Image{hex: hex}
  end

  def pick_color(%Identicon.Image{hex: [r, g, b | _tail]} = image) do
    %Identicon.Image{image | color: {r, g, b}}
  end

  @doc """
  Takes Image struct, returns 5x5 grid that implements identicon mirroring
  """
  def build_grid(%Identicon.Image{hex: hex} = image) do
    hex
    |> Enum.chunk(3)
    |> Enum.map(&mirror_row/1)
  end

  @doc """
  Inputs list of 3 numbers, outputs list of 5 numbers based on mirroring of input

    ## Examples
    iex> Identicon.mirror_row([114, 179, 2])
    [114, 179, 2, 179, 114]
  """
  def mirror_row(row) do
    [first, second | _tail] = row
    row ++ [second, first]
  end
end
