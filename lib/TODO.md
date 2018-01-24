Support syntax

```elixir

dep fun %CustomDep{x: x} do:
    def name(x, [y: y]) do
        1
    end

dep myfun %MyDep{} = x, do:
    fn ->
    end

```