# atomdash = &(String.replace(&1, "_", "-"))

# stream = File.stream!("./Fn.exs")
# IO.inspect(Enum.take(stream, 100)[:path])

# -----------------------------------------------------

# 🎉 Fibonacci
# defmodule Fib do
#   # ✅ using stream
#   # def fib() do
#   #   Stream.unfold( {0, 1}, fn ({current, next}) ->
#   #     {current, {next, current + next}}
#   #   end)
#   # end

#   # ✅ tail call optimized
#   # def time(func, arg) do
#   #   t0 = Time.utc_now
#   #   func.(arg)
#   #   Time.diff(Time.utc_now, t0, :millisecond)
#   # end

#   # def calculate(n \\ 45) do
#   #   IO.puts "time => #{time(&fib/1, n)}"
#   # end

#   # def fib(n), do: fib(n, 0, 1)
#   # def fib(1, _a, b), do: b
#   # def fib(n, a, b) do
#   #   fib(n - 1, b, a + b)
#   #   # IO.puts(b)
#   # end

#   # ✅ using list
#   # defp fib(0), do: [0 | 0]
#   # defp fib(1), do: [1 | 0]

#   # defp fib(n) do
#   #   [h | t] = fib(n-1)
#   #   IO.inspect([h + t | h])
#   # end

#   # ✅ building list
#   # def fib(nth) do
#   #   list = [1, 0]
#   #   calculate(list, nth)
#   # end
#   # defp calculate(list, 2) do
#   #   Enum.reverse(list)
#   # end
#   # defp calculate(list, n) do
#   #   [first_el, second_el | _] = list
#   #   calculate([first_el + second_el | list], n - 1)
#   # end

#   # def calculate(n), do: hd(fib(n))
# end
# IO.inspect(Fn.fib(30))

# -----------------------------------------------------

# 🎉 Map
# defmodule Fn do
#   def sum([head | tail], accumulator) do
#     sum(tail, head + accumulator)
#   end

#   def sum([], accumulator) do
#     accumulator
#   end
# end
# IO.puts(Fn.sum([1,2,3,4,5,6,7,8,9], 0))

# 🎉 Reduce
defmodule Fn do
  def double([head | tail]) do
    IO.puts(head * 2)
    [head * 2 | double(tail)]
  end

  def double([]) do
    []
  end
end
result = Fn.double([1,2,3,4,5,6,7,8,9])
IO.puts(result)

# -----------------------------------------------------

# CRC
# defmodule Number do
#   def new(string), do: Integer.parse(string) |> elem(0)
#   def add(num, addend) do
#     IO.puts("#{num} + #{addend}")
#     num + addend
#   end
#   def to_string(num), do: Integer.to_string(num)
# end

# list = [1, 2, 3]
# total = Number.new("0")
# reducer = &Number.add(&2, &1)
# converter = &Number.to_string/1

# IO.puts(Enum.reduce(list, total, reducer) |> converter.())
