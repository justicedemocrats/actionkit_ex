defmodule Ak.Helpers do
  def isoify(timestamp) do
    if String.ends_with?(timestamp, "Z") do
      timestamp
    else
      timestamp <> "Z"
    end
  end

  def in_est(timestamp) do
    {:ok, utc, _} = isoify(timestamp) |> DateTime.from_iso8601()
    est = Timex.Timezone.get("America/New_York")
    Timex.Timezone.convert(utc, est)
  end

  def in_pst(timestamp) do
    {:ok, utc, _} = isoify(timestamp) |> DateTime.from_iso8601()
    pst = Timex.Timezone.get("America/Los_Angeles")
    Timex.Timezone.convert(utc, pst)
  end
end
