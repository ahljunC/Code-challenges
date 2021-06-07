defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    roman_num_map = %{
      50000 => "V",
      1000 => "M",
      500 => "D",
      400 => "CD",
      100 => "C",
      90 => "XC",
      50 => "L",
      40 => "XL",
      10 => "X",
      9 => "IX",
      5 => "V",
      4 => "IV",
      1 => "I"
    }
    |> Enum.reduce("", fn roman_num, acc ->
      if rem(number, Map.keys(roman_num)) >= 1 do
        IO.inspect(acc <> roman_num)
      end
    end)
  end
end
