

defmodule Abc do
  defmacro dep head, body do
    [_|rest] = Tuple.to_list(head)
    new_head = [:create | rest] |> List.to_tuple
    |> IO.inspect
    name = elem(head, 0) |> Atom.to_string
    # v = """
    # defmodule Comp do
    #   def build %{a: a} do
    #     a
    #   end
    # end
    # """
    contents =
      quote do
        def(newhead, body)
      end
    mod = Module.concat([M, name])
    quote do:
      Module.create(
        M.Comp, unquote(contents),
        unquote(Macro.Env.location(__ENV__))
      )
    # quote do:
    #   unquote(v)
    nil
  end
end


defmodule M do
  import Abc
  dep comp %M.D{a: a}, %ff{} do
    a
  end

  # defmodule Comp do
  #   def build %{a: a} do
  #     a
  #   end
  # end
end

defmodule Before do
  def __before_compile__(env) do
    contents =
      quote do
        def world, do: true
      end

    Module.create(
      N.Comp, contents,
      Macro.Env.location(env)
    )
  end
end

defmodule N do
  # TODO __using__
  @before_compile Before


end