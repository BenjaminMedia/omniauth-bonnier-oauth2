#OmniAuth Bonnier OAuth2

Strategy to authenticate Bonnier in OmniAuth.

It's using the OAuth2 from the Bonnier API

##Usage
Add the strategy to your `Gemfile` alongside OmniAuth:

```ruby
gem 'omniauth'
gem 'omniauth-bonnier-oauth2'
```

Integrate this strategy to your OmniAuth middleware.

```ruby
use OmniAuth::Builder do
  provider :bonnier_oauth2, ENV['BONNIER_KEY'], ENV['BONNIER_SECRET']
end
```

You need to add your key and secret.

Also remember to add the full callback path to your Bonnier App Console, for example: http://example.com/auth/bonnier-oauth2/callback

For more information check the [OmniAuth wiki](https://github.com/intridea/omniauth/wiki).
