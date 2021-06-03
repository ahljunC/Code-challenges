defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    # G -> C
    # 71 -> 67

    # C -> G
    # 67 -> 71

    # T -> A
    # 84 -> 65

    # A -> U
    # 65 -> 85

    rna_map = %{71 => 67, 67 => 71, 84 => 65, 65 => 85}

    Enum.map(dna, fn(char)
      ->  Map.get(rna_map, char)
    end)
  end
end
