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
    phrase
    |> String.split()
    |> Enum.map(&String.to_charlist/1)
    |> Enum.map(&pig_check/1)
    |> Enum.join(" ")
  end

  defp pig_check([head | _] = phrase) when head in @vowel_list do
    List.to_string(phrase ++ [?a, ?y])
  end

  defp pig_check([first, second | _] = phrase) when first == ?x and second not in @vowel_list do
    List.to_string(phrase ++ [?a, ?y])
  end

  defp pig_check([first, second | _] = phrase) when first == ?y and second not in @vowel_list do
    List.to_string(phrase ++ [?a, ?y])
  end

  defp pig_check([first, second | tail]) when first == ?q and second == ?u do
    List.to_string(tail ++ [first, second, ?a, ?y])
  end

  defp pig_check([first, second, third | tail]) when first not in @vowel_list and second == ?q and third == ?u do
    List.to_string(tail ++ [first, second, third, ?a, ?y])
  end

  defp pig_check(phrase) do
    head = Enum.reduce_while(phrase, [], fn char, acc ->
      if char not in @vowel_list, do: {:cont, acc ++ [char]}, else: {:halt, acc}
    end)

    tail = phrase -- head
    List.to_string(tail ++ head ++ [?a, ?y])
  end
end
