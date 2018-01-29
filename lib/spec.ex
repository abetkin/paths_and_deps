
"""
can get a list of all modules
|> containing dep

interface: use Di

optional parameters ?
what about recursion?

execute everything that can find


tail recursion with modules?
"""

defmodule Dep do
  defp create %{param: p} do
    p
  end
end

defmodule M do


  # defstruct [:a, :b]

  def create %Dep{} = d do
    %M{a: d, b: nil}
  end


  dep create %{some: context}, %Dep{} = d do
    %{some: result}    
  end

  dep %{some: property}, %SomeDep{} do
    
  end

  dep smth %{some: data}, after: [f1, f2] do
    
  end


  def t do
    run M, %{param: "obj"}
  end
end


defmodule M2 do
  use Di

  defmodule Comp do
    def init %Dep{} = d do
      %Comp{}
    end
  end
end