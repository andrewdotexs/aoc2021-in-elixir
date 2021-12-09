defmodule DayTwo do
  defmodule Result do
    defstruct [f_tot: 0, d_tot: 0, aim: 0]
  end

  defmodule Pt1 do
    def resolve_puzzle do
      {:ok, data} = File.read(Path.join(~w(#{File.cwd!} media/input02.txt)))
      data
      |> parse_input
    end

    def parse_input(data) do
      magn = %{"forward" => 1, "down" => 1, "up" => -1}

      res = data
      |> String.split("\n")
      |> Enum.filter(&(&1 != ""))
      |> Enum.reduce(%DayTwo.Result{}, fn x, acc ->
        [command, units] = String.split(x, " ")
        command_magn = magn[command]
        value = String.to_integer(units)
        #IO.puts "command: #{command} [#{command_magn}] <- #{value}"
        case command do
          "forward" ->
            %DayTwo.Result{acc | f_tot: acc.f_tot + (value * command_magn)}
          c when c == "down" or c == "up" ->
            %DayTwo.Result{acc | d_tot: acc.d_tot + (value * command_magn)}
        end
      end)

      res.f_tot * res.d_tot
    end
  end

  defmodule Pt2 do
    def resolve_puzzle do
      {:ok, data} = File.read(Path.join(~w(#{File.cwd!} media/input02.txt)))
      data
      |> parse_input
    end

    def parse_input(data) do
      magn = %{"down" => 1, "up" => -1}

      res = data
      |> String.split("\n")
      |> Enum.filter(&(&1 != ""))
      |> Enum.reduce(%DayTwo.Result{}, fn x, acc ->
        [command, units] = String.split(x, " ")
        command_magn = magn[command]
        value = String.to_integer(units)
        #IO.puts "command: #{command} [#{command_magn}] <- #{value}"
        case command do
          "forward" ->
            %DayTwo.Result{acc | f_tot: acc.f_tot + value, d_tot: acc.d_tot + (value * acc.aim)}
          c when c == "down" or c == "up" ->
            %DayTwo.Result{acc | aim: acc.aim + (value * command_magn)}
        end
      end)

      res.f_tot * res.d_tot
    end
  end
end
