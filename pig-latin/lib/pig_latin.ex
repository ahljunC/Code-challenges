defmodule PigLatin do
  @vowel_list [?a, ?e, ?i, ?o, ?u]
  # @consonant_list ["ch", "qu", "squ", "th", "thr", "sch"]

  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    String.to_charlist(phrase)
    |> pig_check()
  end

  defp pig_check([head | _tail] = phrase) when head in @vowel_list do
    phrase ++ [?a, ?y]
    |> List.to_string()
  end

  defp pig_check([first, second | _tail] = phrase) when first == ?x and second == ?r do
    phrase ++ [?a, ?y]
    |> List.to_string()
  end

  defp pig_check([first, second | _tail] = phrase) when first == ?y and second == ?t do
    phrase ++ [?a, ?y]
    |> List.to_string()
  end

  defp pig_check(phrase) do
    head = Enum.reduce_while(phrase, [], fn char, acc ->
      if char not in @vowel_list, do: {:cont, acc ++ [char]}, else: {:halt, acc}
    end)

    # tail ++ head ++ [?a, ?y]
    # |> List.to_string()

  end

  # defp pig_check([first, second | tail]) when first not in @vowel_list and second not in @vowel_list do
  #   tail ++ [first] ++ [second] ++ [?a, ?y]
  #   |> List.to_string()
  # end

  # defp pig_check([head | tail]) do
  #   tail ++ [head] ++ [?a, ?y]
  #   |> List.to_string()
  # end
end
