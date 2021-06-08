defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @chars_upper ?A..?Z
  @chars_lower ?a..?z

  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do

    String.to_charlist(text)
    |> Enum.reduce([], fn char, acc ->
      acc ++ [char_shift(char, shift)]
    end)
    |> List.to_string()
  end

  defp char_shift(char, shift) when char in @chars_upper do
    if char + shift <= ?Z do
      char + shift
    else
      64 + rem(char + shift, ?Z)
    end
  end

  defp char_shift(char, shift) when char in @chars_lower do
    if char + shift <= ?z do
      char + shift
    else
      96 + rem(char + shift, ?z)
    end
  end

  defp char_shift(char, _shift) do
    char
  end
end
