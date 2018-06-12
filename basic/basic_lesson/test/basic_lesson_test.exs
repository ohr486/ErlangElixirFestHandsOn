defmodule BasicLessonTest do
  use ExUnit.Case
  doctest BasicLesson

  test "greets the world" do
    assert BasicLesson.hello() == :world
  end
end
