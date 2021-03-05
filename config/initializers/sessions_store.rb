if Rails.env == "production"
    Rails.application.config.session_store :cookie_store, key: "_funding_api", domain: "https://frozen-tor-16945.herokuapp.com" 
else
    Rails.application.config.session_store :cookie_store, key: "_funding_api"
end