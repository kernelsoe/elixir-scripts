defmodule Accumulator do
  def loop(anagrams \\ %{}) do
    receive do
      {from, {:add, {letters, word}}} ->
        IO.inspect("received 👍 letters: #{letters} 👍 word: #{word}")
        anagrams = add_word(anagrams, letters, word)
        send(from, :ok)
        loop(anagrams)

      {from, :list} ->
        send(from, {:ok, list_anagram(anagrams)})
        loop(anagrams)
    end
  end

  defp add_word(anagrams, letters, word) do
    words = Map.get(anagrams, letters, [])

    anagrams
    |> Map.put(letters, [word | words])
  end

  defp list_anagram(anagrams) do
    anagrams
    |> Enum.filter(fn {k, v} -> length(v) >= 3 end)
  end
end
