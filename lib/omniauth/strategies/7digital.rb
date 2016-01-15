require 'omniauth-oauth'

module OmniAuth
  module Strategies
    class SevenDigital < OmniAuth::Strategies::OAuth

      option :name, 'seven_digital'

      option :client_options, { :access_token_path => '/1.2/oauth/accesstoken',
                                :request_token_path => '/1.2/oauth/requesttoken',
                                :site => 'https://api.7digital.com' }

      def request_phase
        request_token = consumer.get_request_token({ :exclude_callback => true }, options.request_params)
        session['oauth'] ||= {}
        session['oauth'][name.to_s] = { 'callback_confirmed' => request_token.callback_confirmed?, 'request_token' => request_token.token, 'request_secret' => request_token.secret }

        params = { :oauth_token => request_token.token, :oauth_callback => callback_url }.map { |key, value| "#{key}=#{Rack::Utils.escape(value)}" }.join('&')
        redirect "https://account.7digital.com/#{options.consumer_key}/oauth/authorise?#{params}"
      rescue ::Timeout::Error => e
        fail!(:timeout, e)
      rescue ::Net::HTTPFatalError, ::OpenSSL::SSL::SSLError => e
        fail!(:service_unavailable, e)
      end

      def callback_phase
        fail(OmniAuth::NoSessionError, 'Session Expired') if session['oauth'].nil?

        request_token = ::OAuth::RequestToken.new(consumer, session['oauth'][name.to_s].delete('request_token'), session['oauth'][name.to_s].delete('request_secret'))

        @access_token = request_token.get_access_token({}, {})

        env['omniauth.auth'] = auth_hash
        call_app!
      rescue ::Timeout::Error => e
        fail!(:timeout, e)
      rescue ::Net::HTTPFatalError, ::OpenSSL::SSL::SSLError => e
        fail!(:service_unavailable, e)
      rescue ::OAuth::Unauthorized => e
        fail!(:invalid_credentials, e)
      rescue ::OmniAuth::NoSessionError => e
        fail!(:session_expired, e)
      end
    end
  end
end
