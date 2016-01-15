require 'spec_helper'

describe OmniAuth::Strategies::SevenDigital do
  subject do
    OmniAuth::Strategies::SevenDigital.new({})
  end

  context 'client options' do
    it 'should have correct name' do
      expect(subject.options.name).to eq('seven_digital')
    end

    it 'should have correct site' do
      expect(subject.options.client_options.site).to eq('https://api.7digital.com')
    end

    it 'should have correct request token url' do
      expect(subject.options.client_options.request_token_path).to eq('/1.2/oauth/requesttoken')
    end

    it 'should have correct access token url' do
      expect(subject.options.client_options.access_token_path).to eq('/1.2/oauth/accesstoken')
    end
  end
end
