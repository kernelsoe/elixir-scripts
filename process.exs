# parent = self()

# spawn(fn -> send(parent, {:hello, self()}) end)

# receive do
#   {:hello, pid} -> "Got hello from #{inspect pid}"
# end

defmodule Printer do
  def run() do
    receive do
      {:hi, value} ->
        IO.puts(value)
      {_, value} ->
        IO.puts "Hi!, #{value}"
    end

    run()
  end
end
