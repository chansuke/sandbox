defmodule Math do
  def zero?(0) do
    true
  end

  def zero?(0.0) do
    true
  end

  def zero?(x) when is_number(x) do
    false
  end

  def zero?(x) when not is_number(x) do
    {:NaN, false}
  end
end

ExUnit.start

defmodule IsZeroTest do
  use ExUnit.Case

  test "zeros with int and float" do
    assert Math.zero?(0) == true
    assert Math.zero?(0.0) == true
  end

  test "non-zeros with int and float" do
    assert Math.zero?(1) == false
    assert Math.zero?(1.0) == false
  end

  test "string case" do
    assert Math.zero?("a") == {:NaN, false}
  end

  test "list case" do
    assert Math.zero?([1,2,3]) == {:NaN, false}
  end

end
