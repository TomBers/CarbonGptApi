defmodule CarbonGptApiWeb.Schemas.Generation do
  alias OpenApiSpex.Schema
  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "Generation percentage",
    description: "Breakdown of carbon intensity of the grid",
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
        generationmix: %Schema{
          type: :object,
          description: "Fuel mix of the grid",
          properties: %{
            fuel: %Schema{type: :string, description: "Name of the fuel"},
            perc: %Schema{type: :number, description: "Fuel percentage"}
          }
        }
      }
    }
  })
end
