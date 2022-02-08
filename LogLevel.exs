# defmodule LogLevel do
#   def to_label(level, legacy?) do
#     cond do
#       level == 0 and legacy? == false -> :trace
#       level == 1 -> :debug
#       level == 2 -> :info
#       level == 3 -> :warning
#       level == 4 -> :error
#       level == 5 and legacy? == false -> :fatal
#       true -> :unknown
#     end
#   end
#   def alert_recipient(level, legacy?) do
#     cond do
#       to_label(level, legacy?) == :error or to_label(level, legacy?) == :fatal -> :ops
#       to_label(level, legacy?) == :unknown and legacy? == true -> :dev1
#       to_label(level, legacy?) == :unknown and legacy? == false -> :dev2
#       true -> nil
#     end
#   end
# end

defmodule LogLevel do
  @labels %{
    0 => :trace,
    1 => :debug,
    2 => :info,
    3 => :warning,
    4 => :error,
    5 => :fatal
  }

  @all_codes 0..5
  @legacy_codes 1..4
  def to_label(level, legacy?) do
    cond do
      legacy? and level in @legacy_codes -> @labels[level]
      not legacy? and level in @all_codes -> @labels[level]
      true -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    label = to_label(level, legacy?)

    cond do
      label in [:error, :fatal] -> :ops
      label == :unknown and legacy? -> :dev1
      label == :unknown -> :dev2
      true -> nil
    end
  end
end
