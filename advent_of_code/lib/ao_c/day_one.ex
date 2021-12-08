defmodule DayOne do
  defmodule Pt1 do
    def resolve_puzzle do
      input_path = Path.join(File.cwd!, "media/input01.txt")
      read_input(input_path)
      |> gen_stat
    end

    def read_input(path) do
      {:ok, data} = File.read(path)
      data
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

    end
  end
end
