Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # Replace with the exact URL and port your React app runs on
    origins '*' 

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      credentials: false # Set to true if you are using cookies/sessions
  end
end
