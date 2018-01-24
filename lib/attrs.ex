defmodule Greetify do

    defmacro __using__(_) do
      quote do
        Module.register_attribute __MODULE__, :greet, accumulate: true,
          persist: false
        @before_compile Greetify
      end
    end
  
    defmacro __before_compile__(env) do
      greetings = Module.get_attribute(env.module, :greet)
      for {name, age} <- greetings do
        IO.puts "#{name} is #{age} years old"
      end
    end
  
end



defmodule M do
    use Greetify

    @greet {"Jon", 21}
    @greet {"Sam", 23}
end