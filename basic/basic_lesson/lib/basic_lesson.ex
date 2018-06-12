defmodule BasicLesson do
  # fileの読み込み
  def json_stream do
    File.stream!("data.json")
  end

  # jsonのパース
  def decode(json_str) do
    Poison.decode!(json_str)
  end

  # 20歳以下のカウント(Enum ver)
  def count_u20 do
    json_stream
    |> Enum.map(&decode/1)
    |> Enum.filter(fn d -> d["age"] < 20 end)
    |> Enum.count
  end

  # 20歳以下のカウント(Stream ver)
  def count_u20_v2 do
    json_stream
    |> Stream.map(&decode/1)
    |> Stream.filter(fn d -> d["age"] < 20 end)
    |> Enum.count
  end

  # 20歳以下のカウント(Flow ver)
  def count_u20_v3 do
    json_stream
    |> Flow.from_enumerable 
    |> Flow.map(&decode/1)
    |> Flow.filter(fn d -> d["age"] < 20 end)
    |> Flow.partition
    |> Enum.count
  end




  def count_u20_male do
    json_stream
    |> Enum.map(&decode/1)
    |> Enum.filter(fn d -> (d["age"] < 20) && (d["sex"] == "male") end)
    |> Enum.count
  end

end
