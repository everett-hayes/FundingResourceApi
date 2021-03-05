# Rails.application.config.session_store :cookie_store, {
#     :key => '_funding_api', 
#     :domain => 'https://frozen-tor-16945.herokuapp.com',
#     :same_site => :none,
#     :secure => :true,
#     :tld_length => 2 
# }

Rails.application.config.session_store :cookie_store, key: "_funding_api", domain: "https://frozen-tor-16945.herokuapp.com", same_site: none, secure: true

# if Rails.env == "production"
#     Rails.application.config.session_store :cookie_store, {
#          :key => "_funding_api", 
#          :domain => "https://frozen-tor-16945.herokuapp.com",
#          :same_site => :none,
#          :secure => :true 
#     }
# else
#     Rails.application.config.session_store :cookie_store, key: "_funding_api"
# end