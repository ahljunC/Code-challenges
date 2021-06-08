defmodule Bob do
  def hey(input) do
    input = String.trim(input)

    cond do
      # TRUE if only contains white space
      silence?(input) -> "Fine. Be that way!"

      # TRUE if all uppercase and ends with ?
      aggresive_question?(input) -> "Calm down, I know what I'm doing!"

      # TRUE if all uppercase
      shouting?(input) -> "Whoa, chill out!"

      # TRUE if ends with ?
      question?(input) -> "Sure."

      true -> "Whatever."
    end
  end

  defp silence?(input) do
    input == ""
  end

  defp aggresive_question?(input) do
    shouting?(input) && question?(input)
  end

  defp shouting?(input) do
    input == String.upcase(input) && String.downcase(input) != input
  end

  defp question?(input) do
    String.ends_with?(input, "?")
  end

end
