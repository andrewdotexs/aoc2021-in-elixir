defmodule DayThree do
  defmodule Result do
    defstruct [gamma_rate: "", epsilon_rate: ""]
  end

  defmodule Pt1 do
    def resolve_puzzle do
      {:ok, data} = File.read(Path.join(~w(#{File.cwd!} media/input03.txt)))
      data
      |> bin_diagnostic
    end

    def bin_diagnostic(data) do
      res = data
      |> String.split(~r{(\r\n|\r|\n)}, trim: true)
      |> Enum.reduce([], fn x, acc ->
        [
          String.split(x, "", trim: true)
          |> Enum.map(&String.to_integer/1)
          | acc
        ]
      end)
      |> Enum.zip
      |> Enum.map(&(Tuple.to_list(&1)))
      |> Enum.reduce(%DayThree.Result{}, fn x, acc ->
        avg = (x |> Enum.reduce(0, &(&1 + &2))) / length(x)

        if avg > 0.5 do
          %DayThree.Result{acc |
            gamma_rate: acc.gamma_rate <> "1",
            epsilon_rate: acc.epsilon_rate <> "0"}
        else
          %DayThree.Result{acc |
            gamma_rate: acc.gamma_rate <> "0",
            epsilon_rate: acc.epsilon_rate <> "1"}
        end
      end)

      String.to_integer(res.gamma_rate, 2) * String.to_integer(res.epsilon_rate, 2)
    end
  end
end
