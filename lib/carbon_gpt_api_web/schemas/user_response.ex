defmodule CarbonGptApiWeb.Schemas.UserResponse do
  require OpenApiSpex
  alias CarbonGptApiWeb.Schemas.User

  OpenApiSpex.schema(%{
    title: "UserResponse",
    description: "Response schema for single user",
    type: :object,
    properties: %{
      data: User
    },
    example: %{
      "data" => %{
        "id" => 123,
        "name" => "Joe User",
        "email" => "joe@gmail.com",
        "birthday" => "1970-01-01T12:34:55Z",
        "inserted_at" => "2017-09-12T12:34:55Z",
        "updated_at" => "2017-09-13T10:11:12Z"
      }
    }
  })
end
