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

  defmacro get_paths(head, body) do
    attrs = case head do
      {:%{}, [line: _], attrs} -> attrs
      {:%, [line: _], attrs} -> attrs
    end
    IO.inspect attrs
    nil
  end
  
end

defmodule Aa do
  defstruct [:value]
end

defmodule M do
  import Di
  get_paths %{a: b} do
    1
  end

  get_paths %Aa{a: b, d: 4} do
    1
  end
end

