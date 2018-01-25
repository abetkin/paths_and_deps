defmodule Greetify do

    defmacro __using__(_) do
      quote do
        import Greetify
        Module.register_attribute __MODULE__, :greet, accumulate: true,
          persist: true
        @before_compile Greetify
      end
    end
  
    defmacro __before_compile__(env) do
      greetings = Module.get_attribute(env.module, :greet)
      IO.inspect greetings
    end

    defmacro dep(head, body) do
      
      quote do
        @greet unquote(1)
        def(unquote(head), unquote(body))
      end
    end
  
end



defmodule M do
  use Greetify

  dep f1 do
    
    1
  end

  dep f2 do
    
    1
  end

  dep f x do
    
  end
end