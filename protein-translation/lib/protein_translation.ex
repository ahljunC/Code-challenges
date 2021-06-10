defmodule ProteinTranslation do
  @codon_protein_map %{
    "AUG" => "Methionine",
    "UUU" => "Phenylalanine", "UUC" => "Phenylalanine",
    "UUA" => "Leucine", "UUG" => "Leucine",
    "UCU" => "Serine", "UCC" => "Serine", "UCA" => "Serine", "UCG" => "Serine",
    "UAU" => "Tyrosine", "UAC" => "Tyrosine",
    "UGU" => "Cysteine", "UGC" => "Cysteine",
    "UGG" => "Tryptophan",
    "UAA" => "STOP", "UAG" => "STOP", "UGA" => "STOP",
  }

  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna(rna) do
    translate = String.codepoints(rna)
    |> Enum.chunk_every(3)
    |> Enum.map(&Enum.join/1)
    |> Enum.map(&get_codon_name/1)

    case is_valid_rna?(translate) do
      :error -> {:error, "invalid RNA"}
      :ok -> {:ok, get_codon_list(translate)}
    end
  end

  def get_codon_list(codon_list) do
    codon_list
    |> Enum.reduce_while([], fn codon, acc ->
      if codon !== "STOP", do: {:cont, acc ++ [codon]}, else: {:halt, acc}
    end)
  end

  def get_codon_name(codon) do
    Map.get(@codon_protein_map, codon)
  end

  def is_valid_rna?(codon_list) do
    validate = Enum.find_value(codon_list, fn codon -> codon == nil end)

    case validate do
      true -> :error
      _ -> :ok
    end
  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: {atom, String.t()}
  def of_codon(codon) do
    cond do
      Map.has_key?(@codon_protein_map, codon) ->
        {:ok, Map.get(@codon_protein_map, codon)}
      true ->
        {:error, "invalid codon"}
    end
  end
end
