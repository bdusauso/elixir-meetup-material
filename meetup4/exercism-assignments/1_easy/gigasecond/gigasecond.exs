defmodule Gigasecond do

  @seconds_count 1_000_000_000

	@doc """
	Calculate a date one billion seconds after an input date.
	"""
	@spec from({pos_integer, pos_integer, pos_integer}) :: :calendar.date

	def from(date) do
    {date, {0, 0, 0}}
      |> convert_to_seconds
      |> add_seconds_count
      |> convert_to_date
	end

  defp convert_to_seconds(datetime) do
    :calendar.datetime_to_gregorian_seconds(datetime)
  end

  defp add_seconds_count(seconds) do
    seconds + @seconds_count
  end

  defp convert_to_date(seconds) do
    :calendar.gregorian_seconds_to_datetime(seconds) |> elem(0)
  end

end