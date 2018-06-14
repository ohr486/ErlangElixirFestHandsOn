defmodule Basic do
  @moduledoc """
  Documentation for Basic.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Basic.hello
      :world

  """
  def hello do
    :world
  end

  # 基本問題1
  def q1 do
    "data.json"
    |> File.stream!
    |> Enum.map(fn d -> Poison.decode!(d) end)
    |> Enum.filter(fn d -> d["age"] <= 20 end)
    |> Enum.count
  end

  # 基本問題2
  def q2_1 do
    "data.json"
    |> File.stream!
    |> Stream.map(fn d -> Poison.decode!(d) end)
    |> Stream.filter(fn d -> d["age"] <= 20 end)
    |> Enum.count
  end

  # 基本問題2
  def q2_2 do
    "data.json"
    |> File.stream!
    |> Flow.from_enumerable
    |> Flow.map(fn d -> Poison.decode!(d) end)
    |> Flow.partition
    |> Flow.filter(fn d -> d["age"] <= 20 end)
    |> Enum.count
  end
end
