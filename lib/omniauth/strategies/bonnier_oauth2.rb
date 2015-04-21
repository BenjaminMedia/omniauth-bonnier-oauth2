require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class BonnierOauth2 < OmniAuth::Strategies::OAuth2
      option :name, "bonnier_oauth2"
      option :client_options, {
        :site               => 'http://localhost:3000',
        :authorize_url      => '/api/oauth/authorize',
        :token_url          => '/api/oauth/token'
      }

      uid { raw_info["id"].to_s }

      info do
        {
          "email" => raw_info["email"],
          "username" => raw_info["username"],
          "profile_image" => raw_info["profile_image"]
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v2/users/current.json').parsed
      end
    end
  end
end
