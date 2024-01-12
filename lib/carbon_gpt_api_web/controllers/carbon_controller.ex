defmodule CarbonGptApiWeb.CarbonController do
  use CarbonGptApiWeb, :controller
  use OpenApiSpex.ControllerSpecs

  alias CarbonGptApiWeb.Schemas.CarbonIntensity
  alias CarbonGptApiWeb.Schemas.Factors
  alias CarbonGptApiWeb.Schemas.Generation
  alias CarbonGptApiWeb.Schemas.Statistics

  operation :get_current_carbon_intensity,
    summary: "Get Carbon Intensity data for current half hour",
    responses: [
      ok: {"Carbon intensity response", "application/json", CarbonIntensity}
    ]

  def get_current_carbon_intensity(conn, _params) do
    json(conn, CarbonGptApi.CarbonInterface.get_current_intensity())
  end

  operation :get_todays_carbon_intensity,
    summary: "Get Carbon Intensity data for today",
    responses: [
      ok: {"Carbon intensity response", "application/json", CarbonIntensity}
    ]

  def get_todays_carbon_intensity(conn, _params) do
    json(conn, CarbonGptApi.CarbonInterface.get_todays_intensity())
  end

  operation :get_intensity_for_date,
    summary: "Get Carbon Intensity data for a given date",
    parameters: [
      date: [
        in: :path,
        description: "Date to get intensity for",
        type: :string,
        example: "2021-01-01"
      ]
    ],
    responses: [
      ok: {"Carbon intensity response", "application/json", CarbonIntensity}
    ]

  def get_intensity_for_date(conn, %{"date" => date}) do
    json(conn, CarbonGptApi.CarbonInterface.get_intensity_for_date(date))
  end

  operation :get_intensity_factors,
    summary: "Get Carbon Intensity factors",
    responses: [
      ok: {"Carbon intensity factors response", "application/json", Factors}
    ]

  def get_intensity_factors(conn, _params) do
    json(conn, CarbonGptApi.CarbonInterface.get_intensity_factors())
  end

  operation :get_intensity_between_datetimes,
    summary: "Get Carbon Intensity data between two datetimes",
    parameters: [
      from: [
        in: :path,
        description: "Start of period timestamp",
        type: :string,
        example: "2024-01-01T00:00Z"
      ],
      to: [
        in: :path,
        description: "End of period timestamp",
        type: :string,
        example: "2024-01-01T00:30Z"
      ]
    ],
    responses: [
      ok: {"Carbon intensity response", "application/json", CarbonIntensity}
    ]

  def get_intensity_between_datetimes(conn, %{
        "from" => from_datetime,
        "to" => to_datetime
      }) do
    json(
      conn,
      CarbonGptApi.CarbonInterface.get_intensity_between_datetimes(from_datetime, to_datetime)
    )
  end

  operation :get_stats_between_datetimes,
    summary: "Get Carbon Intensity statistics between two datetimes",
    parameters: [
      from: [
        in: :path,
        description: "Start of period timestamp",
        type: :string,
        example: "2024-01-01T00:00Z"
      ],
      to: [
        in: :path,
        description: "End of period timestamp",
        type: :string,
        example: "2024-01-01T00:30Z"
      ]
    ],
    responses: [
      ok: {"Carbon intensity statistics", "application/json", Statistics}
    ]

  def get_stats_between_datetimes(conn, %{
        "from" => from_datetime,
        "to" => to_datetime
      }) do
    json(
      conn,
      CarbonGptApi.CarbonInterface.get_stats_between_datetimes(from_datetime, to_datetime)
    )
  end

  operation :get_generation_between_datetimes,
    summary: "Get Carbon Intensity generation between two datetimes",
    parameters: [
      from: [
        in: :path,
        description: "Start of period timestamp",
        type: :string,
        example: "2024-01-01T00:00Z"
      ],
      to: [
        in: :path,
        description: "End of period timestamp",
        type: :string,
        example: "2024-01-01T00:30Z"
      ]
    ],
    responses: [
      ok: {"Carbon intensity generation", "application/json", Generation}
    ]

  def get_generation_between_datetimes(conn, %{
        "from" => from_datetime,
        "to" => to_datetime
      }) do
    json(
      conn,
      CarbonGptApi.CarbonInterface.get_generation_between_datetimes(from_datetime, to_datetime)
    )
  end
end
