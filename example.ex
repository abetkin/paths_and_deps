
defmodule User do
  use Di, create: :some_func
  defstruct [:name]

  # def create %Http.Header{cookie: cookie}, %Di{run: run} do
  #   fn ->
  #     run M, :f, [:opts]
  #   end
  # end

end

defmodule M do
  use Di

  # defdi f1 %User{logged_in: logged_in} = user do
  defdi f1 %User{} = u do
    fn ->
      Map.size(u) != 0
    end
  end

  def test do
    %{name: :user1}
    |> Di.run(M, :f1)
  end

  """
  spec

  layers, each lr is exe once and used as dep
  no merging deps if they are of same mod, but check inclusion
  
  impl: layers of deps, return list of Dependency
  """

end


defmodule Dependency do
  defstruct [
    :module,
    :paths, # (ordered)
    :function, # (optional)
  ]
end