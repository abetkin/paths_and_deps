
defmodule M do
  defmacro dep(head, body) do
    {name, opts1,
      [{:%, _,
        [{:__aliases__, _, [mod_name]},
          {:%{}, opts2, kv}]}]}
    = head
    new_head = {name, opts1, [{:%{}, opts2, kv}]}
    quote do:
      def(unquote(new_head), unquote(body))
  end
end

defmodule Ab do
  """
  case: Ab is not a struct
  """

  import M
  dep d1 %Ab{a: a} do
    
  end  
end
