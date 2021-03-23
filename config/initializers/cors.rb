Rails.application.config.middleware.insert_before 0, Rack::Cors do

    # Here we tell CORS that local developrs at port 3000 are allowed to communicate with our API
    allow do
        origins "http://127.0.0.1:3000"
        resource "*", headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
    end

    allow do
        origins "http://localhost:3000"
        resource "*", headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
    end

    # Here we tell CORS that the frontend on heroku is allowed to communicate with our API
    allow do
        origins "https://cls-funding-resources.herokuapp.com"
        resource "*", headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
    end

end