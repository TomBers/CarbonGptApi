defmodule CarbonGptApiWeb.UserController do
  use CarbonGptApiWeb, :controller
  use OpenApiSpex.ControllerSpecs

  alias CarbonGptApiWeb.Schemas.User
  alias CarbonGptApiWeb.Schemas.UserResponse

  tags ["users"]
  security [%{}, %{"petstore_auth" => ["write:users", "read:users"]}]

  operation :update_user_by_id,
    summary: "Update user",
    parameters: [
      user_id: [in: :path, description: "User ID", type: :integer, example: 1001]
    ],
    request_body: {"User params", "application/json", User},
    responses: [
      ok: {"User response", "application/json", UserResponse}
    ]

  def update_user_by_id(conn, %{"user_id" => id}) do
    json(conn, %{
      data: %{
        id: id,
        name: "joe user",
        email: "joe@gmail.com"
      }
    })
  end

  def echo(conn, %{"id" => id}) do
    json(conn, %{
      data: %{
        id: id
      }
    })
  end
end
