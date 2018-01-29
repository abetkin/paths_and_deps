

defmodule Resolve do
  # defstruct [:mod, :get_deps]

  def get_layers(modules, records, get_deps) do
    {leaves, branches} = Enum.split_with(modules, fn m ->
      List.size(get_deps.(m)) == 0
    end)
    new_modules = for b <- branches, do:
      get_deps.(b)
      |> List.flatten
    {num, _} = List.last(records)
    get_layers(new_modules, [{num + 1, leaves} | records], get_deps)
    
  end
end