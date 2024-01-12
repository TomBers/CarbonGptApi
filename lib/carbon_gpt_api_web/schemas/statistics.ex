defmodule CarbonGptApiWeb.Schemas.Statistics do
  alias OpenApiSpex.Schema
  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "Carbon Intensity Statistics",
    description: "Statistics on carbon intensity of the grid",
    type: :array,
    items: %Schema{
      type: :object,
      properties: %{
        from: %Schema{
          type: :string,
          description: "Start of period timestamp",
          format: :"date-time"
        },
        to: %Schema{type: :string, description: "End of period timestamp", format: :"date-time"},
        intensity: %Schema{
          type: :object,
          description: "The intensity of the grid",
          properties: %{
            max: %Schema{
              type: :integer,
              description:
                "The maximum Carbon Intensity for the datetime range in units gCO2/kWh. Future periods use forecast data. Past data uses actual data."
            },
            average: %Schema{
              type: :integer,
              description:
                "The average Carbon Intensity for the datetime range in units gCO2/kWh. Future periods use forecast data. Past data uses actual data."
            },
            min: %Schema{
              type: :integer,
              description:
                "The minimum Carbon Intensity for the datetime range in units gCO2/kWh. Future periods use forecast data. Past data uses actual data."
            },
            index: %Schema{
              type: :string,
              description:
                "The index is a measure of the Carbon Intensity represented on a scale between 'very low', 'low', 'moderate', 'high', 'very high'."
            }
          }
        }
      }
    }
  })
end
