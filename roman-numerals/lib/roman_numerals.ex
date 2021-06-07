defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    roman_conversion(number, "")
  end

  defp roman_conversion(number, roman_string) when number == 0 do roman_string end
  defp roman_conversion(number, roman_string) when number >= 1000 do roman_conversion(number - 1000, roman_string <> "M") end
  defp roman_conversion(number, roman_string) when number >= 900 do roman_conversion(number - 900, roman_string <> "CM") end
  defp roman_conversion(number, roman_string) when number >= 500 do roman_conversion(number - 500, roman_string <> "D" ) end
  defp roman_conversion(number, roman_string) when number >= 400 do roman_conversion(number - 400, roman_string <> "CD") end
  defp roman_conversion(number, roman_string) when number >= 100 do roman_conversion(number - 100, roman_string <> "C") end
  defp roman_conversion(number, roman_string) when number >= 90 do roman_conversion(number - 90, roman_string <> "XC") end
  defp roman_conversion(number, roman_string) when number >= 50 do roman_conversion(number - 50, roman_string <> "L") end
  defp roman_conversion(number, roman_string) when number >= 40 do roman_conversion(number - 40, roman_string <> "XL") end
  defp roman_conversion(number, roman_string) when number >= 10 do roman_conversion(number - 10, roman_string <> "X") end
  defp roman_conversion(number, roman_string) when number >= 9 do roman_conversion(number - 9, roman_string <> "IX") end
  defp roman_conversion(number, roman_string) when number >= 5 do roman_conversion(number - 5, roman_string <> "V") end
  defp roman_conversion(number, roman_string) when number >= 4 do roman_conversion(number - 4, roman_string <> "IV") end
  defp roman_conversion(number, roman_string) when number >= 1 do roman_conversion(number - 1, roman_string <> "I") end
end
