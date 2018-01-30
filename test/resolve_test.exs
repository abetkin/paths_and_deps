
defmodule PathsTest do
    use ExUnit.Case
  
    @ctx %{scope: :party}
  
    setup do
        %{a: 2}
    end

    test "simplest", %{a: a} do
      assert a == 1
    end
  


end