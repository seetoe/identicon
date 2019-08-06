defmodule Identicon.Image do
  @moduledoc """
  Struct for our Identicon image.
  Struct enforces that the only properties are the ones we define in defstruct,
  whereas a map allows you to have any property.
  """

  defstruct hex: nil, color: nil, grid: nil, pixel_map: nil
end
