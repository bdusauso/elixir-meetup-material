defmodule Binary do
  @doc """
  Convert a string containing a binary number to an integer.

  On errors returns 0.
  """
  @spec to_decimal(String.t) :: non_neg_integer
  def to_decimal(string) do
    string
      |> String.reverse
      |> String.codepoints
      |> Enum.map(&String.to_integer/1)
      |> Enum.with_index
      |> Enum.map(fn {bin, power} -> bin * :math.pow(2, power) end)
      |> Enum.sum
      |> round
  end
end
