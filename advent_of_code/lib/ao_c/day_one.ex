defmodule DayOne do
  defmodule Pt1 do
    def resolve_puzzle do
      {:ok, data} = File.read(Path.join(~w(#{File.cwd!} media/input01.txt)))
      data
      |> gen_stat
    end

    def gen_stat(data) do
      data
      |> String.split("\n")
      |> Enum.filter(&(&1 != ""))
      |> Enum.map(&String.to_integer/1)
      |> Enum.chunk_every(2, 1, :discard)
      |> Enum.map(fn [x, y] -> y - x end)
      |> Enum.reduce(0, fn (x, acc) ->
        if x > 0, do: 1 + acc, else: acc
      end)
    end
  end

  defmodule Pt2 do
    def resolve_puzzle do
      {:ok, data} = File.read(Path.join(~w(#{File.cwd!} media/input01.txt)))
      data
      |> gen_stat
    end

    def gen_stat(data) do
      data
      |> String.split("\n")
      |> Enum.filter(&(&1 != ""))
      |> Enum.map(&String.to_integer/1)
      |> Enum.chunk_every(3, 1, :discard)
      |> Enum.map(fn [x, y, z] -> x + y + z end)
      |> Enum.chunk_every(2, 1, :discard)
      |> Enum.map(fn [x, y] -> y - x end)
      |> Enum.reduce(0, fn (x, acc) ->
        if x > 0, do: 1 + acc, else: acc
      end)
    end
  end
end
