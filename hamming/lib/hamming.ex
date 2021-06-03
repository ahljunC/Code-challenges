defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance('AAGTCATA', 'TAGCGATC')
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: {:ok, non_neg_integer} | {:error, String.t()}
  def hamming_distance(strand1, strand2) do
    if Enum.count(strand1) != Enum.count(strand2) do
      {:error, "Lists must be the same length"}
    end

    distance =
    Enum.zip_reduce(strand1, strand2, 0, fn char1, char2, acc ->
      if char1 != char2 do
        acc + 1
      else
        acc
      end
    end)

    {:ok, distance}
  end
end
