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
      |> to_decimal
  end

  defp to_decimal(codepoints) do
    add_to_sum = fn (bin, {sum, exp}) -> {sum + (exp * parse_bin(bin)), exp * 2} end
    Enum.reduce(codepoints, {0, 1}, add_to_sum) |> elem 0
  end

  defp parse_bin(bin), do: Integer.parse(bin) |> elem(0)
end
