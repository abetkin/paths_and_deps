

defmodule DepMacro do

  defmacro __using__(_) do
    quote do
      import DepMacro
      Module.register_attribute M, :deps, accumulate: true,
        persist: true
      @before_compile DepMacro
    end
  end

  defmacro __before_compile__(env) do
    IO.puts "HELLO"
    deps = Module.get_attribute(env.module, :deps)
    IO.inspect deps
  end

  # defmacro dep head1, [do: def_block], body do
  #   IO.inspect head1
  #   fn_body = [do: fn_block]
  #   fn_block = {:fn, [line: 36],
  #     [{:->, [line: 36],
  #       [args_block, fn_body]}]}
  # end

  # defmacro dep [do: def_block], body do
  #   {:def, [line: _], [def_block]} = def_block
  #   quote do:
  #       def(unquote(def_block), unquote(body))
  # end

  defmacro mydef head, body do
    # IO.inspect head
    # IO.puts "---"
    # IO.inspect body
    
    name = elem(head, 0)
    Module.put_attribute M, :deps, name
    quote do:
        def(unquote(head), unquote(body))
    # nil
  end

end

defmodule M do
  use DepMacro
  
  # dep %{x: x}, do:
  #     def name(y) do
  #         1
  #     end

  def name %{x: x} do
    fn [path: p] -> "" end
  end
  
  mydef f(x) do
      fn y ->
          x + y
      end
  end

  mydef g(1) do
    1
  end
  
  # mydef f(x) do
  #     x
  # end

  # mydef f(x, y) do
  #     y
  # end
  
  def test do
      M.name |> IO.puts
  end
end