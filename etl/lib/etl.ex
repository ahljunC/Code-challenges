defmodule ETL do
  @doc """
  Transform an index into an inverted index.

  ## Examples

  iex> ETL.transform(%{"a" => ["ABILITY", "AARDVARK"], "b" => ["BALLAST", "BEAUTY"]})
  %{"aardvark" => "a", "ability" => "a", "ballast" => "b", "beauty" => "b"}
  """
  @spec transform(map) :: map
  def transform(input) do
    # input
    # |> Map.new(fn {score, word} ->
    #   {word, score}
    # end)
    # |> Map.merge(input)

    for {score, words} <- input  do
      for word <- words, into: %{}  do
        {String.downcase(word), score}
      end
    end
    |> Enum.reduce(fn map, acc ->
      Map.merge(map, acc)
    end)
  end

end
