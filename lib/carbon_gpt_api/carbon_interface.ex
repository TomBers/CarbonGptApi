defmodule CarbonGptApi.CarbonInterface do
  def get_current_intensity do
    run_req("https://api.carbonintensity.org.uk/intensity")
  end

  def get_todays_intensity do
    run_req("https://api.carbonintensity.org.uk/intensity/date")
  end

  def get_intensity_for_date(date) do
    run_req("https://api.carbonintensity.org.uk/intensity/date/#{date}")
  end

  def get_intensity_factors do
    run_req("https://api.carbonintensity.org.uk/intensity/factors")
  end

  def get_intensity_between_datetimes(from_datetime, to_datetime) do
    run_req("https://api.carbonintensity.org.uk/intensity/#{from_datetime}/#{to_datetime}")
  end

  def get_stats_between_datetimes(from_datetime, to_datetime) do
    run_req("https://api.carbonintensity.org.uk/intensity/stats/#{from_datetime}/#{to_datetime}")
  end

  def get_generation_between_datetimes(from_datetime, to_datetime) do
    run_req("https://api.carbonintensity.org.uk/generation/#{from_datetime}/#{to_datetime}")
  end

  defp run_req(url) do
    Req.get!(url).body["data"]
  end
end
