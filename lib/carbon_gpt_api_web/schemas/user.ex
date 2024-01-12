defmodule CarbonGptApiWeb.Schemas.User do
  alias OpenApiSpex.Schema
  require OpenApiSpex

  OpenApiSpex.schema(%{
    # The title is optional. It defaults to the last section of the module name.
    # So the derived title for MyApp.User is "User".
    title: "User",
    description: "A user of the app",
    type: :object,
    properties: %{
      id: %Schema{type: :integer, description: "User ID"},
      name: %Schema{type: :string, description: "User name", pattern: ~r/[a-zA-Z][a-zA-Z0-9_]+/},
      email: %Schema{type: :string, description: "Email address", format: :email},
      birthday: %Schema{type: :string, description: "Birth date", format: :date},
      inserted_at: %Schema{
        type: :string,
        description: "Creation timestamp",
        format: :"date-time"
      },
      updated_at: %Schema{type: :string, description: "Update timestamp", format: :"date-time"}
    },
    required: [:name, :email],
    example: %{
      "id" => 123,
      "name" => "Joe User",
      "email" => "joe@gmail.com",
      "birthday" => "1970-01-01T12:34:55Z",
      "inserted_at" => "2017-09-12T12:34:55Z",
      "updated_at" => "2017-09-13T10:11:12Z"
    }
  })
end
