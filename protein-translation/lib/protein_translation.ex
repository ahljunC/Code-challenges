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
    |> Enum.reduce_while([], fn codon, acc ->
      {status, message} = of_codon(codon)
      if message !== "STOP", do: {:cont, acc ++ [{status, message}]}, else: {:halt, acc}
    end)

    if Enum.find(translate, fn {status, _codon} -> status == :error end) do
      {:error, "invalid RNA"}
    else
      {:ok, Enum.reduce(translate, [], fn {_status, codon}, acc ->
        acc ++ [codon]
      end)}
    end

    # |> Enum.find(fn {status, codon} ->
    #   case {status, codon} do
    #     {:error, _} -> {:error, "invalid RNA"}
    #     _ -> {:ok, Enum.reduce([], fn {_status, codon}, acc ->
    #       acc ++[codon]
    #     end)
    #   }

    #   end
    # end)

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
    # if Map.has_key?(@codon_protein_map, codon) do
    #   {:ok, Map.get(@codon_protein_map, codon)}
    # else
    #   {:error, "invalid codon"}
    # end

    cond do
      Map.has_key?(@codon_protein_map, codon) ->
        {:ok, Map.get(@codon_protein_map, codon)}
      true ->
        {:error, "invalid codon"}
    end
  end
end
