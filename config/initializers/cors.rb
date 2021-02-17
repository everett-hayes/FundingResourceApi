Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
        origins "https://localhost:5500"
        resource "*", headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
    end

    # give permission to wherever we host our front end right here in the future plz
    # allow do
    #     origins "our front end domain here"
    #     resource "*", headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
    # end

end