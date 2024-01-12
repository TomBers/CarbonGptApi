defmodule CleanOpenapiFile do
  def run do
    {:ok, json} = File.read("openapi.json")
    {:ok, data} = Jason.decode(json)

    # Update the openapi version
    data = Map.put(data, "openapi", "3.1.0")

    # Update the operationId
    updated_paths =
      Enum.map(data["paths"], fn {path, methods} ->
        updated_methods =
          Enum.map(methods, fn {method, details} ->
            operation_id = details["operationId"]
            updated_operation_id = operation_id |> String.split(".") |> List.last()
            {method, Map.put(details, "operationId", updated_operation_id)}
          end)

        {path, Enum.into(updated_methods, %{})}
      end)

    updated_data = Map.put(data, "paths", Enum.into(updated_paths, %{}))

    # Write the updated data back to the JSON file
    File.write!("test_openapi.json", Jason.encode!(updated_data))
  end
end
