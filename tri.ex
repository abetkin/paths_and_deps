defmodule T do

  defstruct [:a]
  
  def init %{} = params do
    [%T{a: params.a}, %{some: "data"}]
  end

  def f1 [%T{} = t, %{some: data}] do
    [t, %{result: 1}]
  end

  def f2 [%T{} = t, %{result: result}] do
    result
  end

  def run do
    init(%{a: 10}) |> f1 |> f2
    |> IO.inspect
  end
  
end