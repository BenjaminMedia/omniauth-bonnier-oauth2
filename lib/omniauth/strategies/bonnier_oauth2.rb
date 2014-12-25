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

      uid { raw_info["user"]["id"] }

      info do
        {
          "email" => raw_info["user"]["email"],
          "first_name" => raw_info["user"]["first_name"],
          "last_name" => raw_info["user"]["last_name"]
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v1/users/current.json').parsed
      end
    end
  end
end
