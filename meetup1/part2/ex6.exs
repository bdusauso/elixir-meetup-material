# Implement and run a function sum(n) that uses recursion to
# calculate the sum of the integers from 1 to n.
# Make sure the function does not accept negative numbers.


defmodule Sum do

  def sum(1), do: 1
  def sum(n) when n > 1, do: n + sum(n - 1)
end



ExUnit.start

defmodule SumTest do
  use ExUnit.Case

  test "it sums up stuff..." do
    assert Sum.sum(1)  == 1
    assert Sum.sum(5)  == 15
    assert Sum.sum(10) == 55
  end


end
