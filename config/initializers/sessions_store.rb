if Rails.env == "production"
    Rails.application.config.session_store :cookie_store, key: "_funding_api", domain: :all, same_site: :none, secure: true
else
    Rails.application.config.session_store :cookie_store, key: "_funding_api"
end