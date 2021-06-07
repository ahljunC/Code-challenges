defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    Enum.filter(candidates, fn word ->
      String.downcase(base) !== String.downcase(word) && String.bag_distance(String.downcase(base), String.downcase(word)) == 1
    end)
  end
end
