require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class BonnierOauth2 < OmniAuth::Strategies::OAuth2
      args [:client_id, :client_secret, :site]

      option :site
      option :name, "bonnier_oauth2"
      option :client_options, {
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

      def client
        ::OAuth2::Client.new(options.client_id, options.client_secret, deep_symbolize(options.client_options).merge(site: options.site))
      end
    end
  end
end
