defmodule CarbonGptApiWeb.Router do
  use CarbonGptApiWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {CarbonGptApiWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug OpenApiSpex.Plug.PutApiSpec, module: CarbonGptApiWeb.ApiSpec
  end

  scope "/" do
    pipe_through :browser

    get "/", CarbonGptApiWeb.PageController, :home
    get "/swaggerui", OpenApiSpex.Plug.SwaggerUI, path: "/api/openapi"
  end

  # Other scopes may use custom stacks.
  scope "/api" do
    pipe_through :api
    get "/carbon_intensity", CarbonGptApiWeb.CarbonController, :get_current_carbon_intensity
    get "/carbon_intensity/today", CarbonGptApiWeb.CarbonController, :get_todays_carbon_intensity
    get "/carbon_intensity/date/:date", CarbonGptApiWeb.CarbonController, :get_intensity_for_date
    get "/factors", CarbonGptApiWeb.CarbonController, :get_intensity_factors

    get "/carbon_intensity/between/:from/:to",
        CarbonGptApiWeb.CarbonController,
        :get_intensity_between_datetimes

    get "/stats/between/:from/:to", CarbonGptApiWeb.CarbonController, :get_stats_between_datetimes

    get "/generation/between/:from/:to",
        CarbonGptApiWeb.CarbonController,
        :get_generation_between_datetimes

    get "/openapi", OpenApiSpex.Plug.RenderSpec, []
  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:carbon_gpt_api, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: CarbonGptApiWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
