defmodule Di do
  # di - for dependency injection


  defmacro __using__(_) do
    quote do
      import Di
      Module.register_attribute __MODULE__, :di_functions,
        accumulate: true, persist: true
    end
  end

  defmacro defdi(head, body) do
    # parse function deps
    #
    fun_name = elem(head, 0)
    quote do
      @di_functions unquote(fun_name)
      def(unquote(head), unquote(body))
    end
  end

  defmacro rundi o do
    #TODO
    nil
  end

  defp parse_declaration(head) do
    {_name, [line: _], attrs} = head
    for attr <- attrs do
      {:%, _, [
        {:__aliases__, _, [mod_name]},
        {:%{}, _, kv}
      ]} = attr
      mod_name
    end
  end

  defmacro get_paths(head, body) do
    parse_declaration(head)
    |> IO.inspect
    # TODO :=
    # attrs = case head do
    #   {:%{}, [line: _], attrs} -> nil
    #   {:%, [line: _], block} ->
    #     # {:__aliases__, _opts, [mod]}, _attrs = block
    #     IO.inspect block
    #     nil
    # end
    nil
  end
  
end

defmodule Aa do
  defstruct [:value]
end

defmodule Bb do
  defstruct []
end

defmodule Cc do
  defstruct []
end

defmodule M do
  import Di
  alias Aa, as: Bb
  # get_paths %{a: b} do
  #   1
  # end

  get_paths f(%Aa{a: b, d: 4}, %Bb{}, %Cc{x: x})  do
    1
  end

  # get_paths %Bb{} # = bb 
  # do
  #   1
  # end
end

