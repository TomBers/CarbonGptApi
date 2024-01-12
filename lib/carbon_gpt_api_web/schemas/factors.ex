defmodule CarbonGptApiWeb.Schemas.Factors do
  alias ElixirSense.Plugins.Ecto.Schema
  alias OpenApiSpex.Schema
  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "Carbon Intensity Factors",
    description: "The factors used to calculate the carbon intensity of the grid",
    type: :array,
    items: %Schema{
      type: :object,
      properties: %{
        Biomass: %Schema{type: :integer, description: "Biomass"},
        Coal: %Schema{type: :integer, description: "Coal"},
        "Dutch Imports": %Schema{type: :integer, description: "Dutch Imports"},
        "French Imports": %Schema{type: :integer, description: "French Imports"},
        "Gas (Combined Cycle)": %Schema{type: :integer, description: "Gas (Combined Cycle)"},
        "Gas (Open Cycle)": %Schema{type: :integer, description: "Gas (Open Cycle)"},
        Hydro: %Schema{type: :integer, description: "Hydro"},
        "Irish Imports": %Schema{type: :integer, description: "Irish Imports"},
        Nuclear: %Schema{type: :integer, description: "Nuclear"},
        Oil: %Schema{type: :integer, description: "Oil"},
        Other: %Schema{type: :integer, description: "Other"},
        "Pumped Storage": %Schema{type: :integer, description: "Pumped Storage"},
        Solar: %Schema{type: :integer, description: "Solar"},
        Wind: %Schema{type: :integer, description: "Wind"}
      }
    }
  })
end
