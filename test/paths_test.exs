

defmodule Hi do

  dep %{scope: scope}, do:
    def hi [:message, format] do
      case format do
        :short -> "Hi #{who}"
        :long -> "#{scope}: Hi #{who}"
      end
    end
  
  dep do:
    def author [:author], do:
      "Vitalii"
  
end

defmodule Full do
  dep %{[:message, :short] => msg, :author => author}, do:
    def full [:message, :full], do
      msg <> "\n" <> "Best regards, #{author}"
end


defmodule PathsTest do
  use ExUnit.Case

  @ctx %{scope: :party}

  test "simplest" do
    Paths.include([Hi])
    |> Paths.eval([:message, :short])
  end

  test "el" do
    scope = dep do: fn :scope -> :home end
    Paths.include([scope, Hi])
    |> Path.eval([:message, :short])
  end

  test "1" do
    @ctx
    |> Paths.include_modules([Hi, Full])
    |> Paths.eval([:message, :full])
  end

  dep_modules [Hi, Full]

  test "2" do
    @ctx
    |> Paths.eval([:message, :full])
  end
end
