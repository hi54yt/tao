require 'rubygems'
require 'omniauth-renren'
require 'renren'
# Rails.application.config.middleware.use OmniAuth::Builder do
#   # provider :renren, ENV['gmwcIdwNoNNBZ7C9OmnNg'], ENV['I6xZoiNSdqOjNKcmvkIlON7v9Ag98im4JAmfnMyQ']
#   provider :Renren, 'd1500b82d8ab4d3b8016f416d1f6f28b', '11b5e6e187d849a8bff422a5f6846a0f'
# end

#you can use your api_key and api_secret
Renren::Config.api_key = "d1500b82d8ab4d3b8016f416d1f6f28b"
Renren::Config.api_secret = "11b5e6e187d849a8bff422a5f6846a0f"

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :Renren, Renren::Config.api_key, Renren::Config.api_secret
end