defmodule ElixirListFilter do
  def call(list) do
    integer_list = filter(list)

    only_odd =
      Enum.reject(integer_list, fn x ->
        rem(x, 2) == 0
      end)

    length(only_odd)
  end

  defp filter(list) do
    new_list = Enum.map(list, fn x -> Integer.parse(x) end)

    list_filtered = Enum.filter(new_list, fn x -> x !== :error end)

    Enum.map(list_filtered, fn x ->
      {value, _empty} = x
      value
    end)
  end
end
