# here we establish how sessions are stored as cookies in the browser
# this is an absolute mess, I would be careful changing stuff here

if Rails.env == "production"
    Rails.application.config.session_store :cookie_store, key: "_funding_api", same_site: :none, secure: true
else
    Rails.application.config.session_store :cookie_store, key: "_funding_api"
end