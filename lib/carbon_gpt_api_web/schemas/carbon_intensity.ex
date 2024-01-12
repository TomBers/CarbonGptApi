defmodule CarbonGptApiWeb.Schemas.CarbonIntensity do
  alias OpenApiSpex.Schema
  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "Carbon Intensity",
    description: "A forecast of the carbon inensity of the grid",
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
            actual: %Schema{type: :integer, description: "Actual intensity"},
            forecast: %Schema{type: :integer, description: "Forecast intensity"},
            index: %Schema{type: :string, description: "Description of intensity"}
          }
        }
      }
    }
  })
end
