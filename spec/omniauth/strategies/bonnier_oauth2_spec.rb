require 'spec_helper'

describe OmniAuth::Strategies::BonnierOauth2 do
  let(:request) { double('Request', :params => {}, :cookies => {}, :env => {}) }
  let(:parsed_response) { stub('ParsedResponse') }
  let(:response) { stub('Response', :parsed => parsed_response) }
  let(:access_token) { stub('AccessToken', :options => {}) }

  subject do
    args = ['appid', 'secret', @options || {}].compact
    OmniAuth::Strategies::BonnierOauth2.new(*args).tap do |strategy|
      allow(strategy).to receive(:request) {
        request
      }
    end
  end

  describe 'client options' do
    it 'should have correct name' do
      expect(subject.options.name).to eq('bonnier_oauth2')
    end

    it 'should have correct site' do
      expect(subject.options.client_options.site).to eq('http://localhost:3000')
    end

    it 'should have correct authorize url' do
      expect(subject.options.client_options.authorize_url).to eq('/api/oauth/authorize')
    end

    it 'should have correct token url' do
      expect(subject.options.client_options.token_url).to eq('/api/oauth/token')
    end
  end

  describe "#uid" do
    before do
      subject.stub(:raw_info) do
        {'user' => {'id' => '123'}}
      end
    end

    it 'returns the id from raw_info' do
      expect(subject.uid).to eq('123')
    end
  end

  describe "#info" do
    before :each do
      subject.stub(:raw_info) do
        {"user" => {'first_name' => "Mike", 'email' => "mike@example.com"}}
      end
    end

    it 'returns the first_name from raw_info' do
      expect(subject.info['first_name']).to eq('Mike')
    end

    it 'returns the email from raw_info as email' do
      expect(subject.info['email']).to eq('mike@example.com')
    end
  end

  describe "#extra" do
  end

  describe "#raw_info" do
  end
end
