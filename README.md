OmniAuth 7digital
==============

This gem contains the 7digital strategy for OmniAuth.

For more information about the 7digital api: http://developer.7digital.com/

How To Use It
-------------

If you are using Rails, you need to add the gem to your `Gemfile`:

    gem 'omniauth-7digital'

You can pull them in directly from GitHub e.g.:

    gem 'omniauth-7digital', :git => 'git://github.com/Musikee/omniauth-7digital.git'

Once these are in, you need to add the following to your `config/initializers/omniauth.rb`:

    Rails.application.config.middleware.use OmniAuth::Builder do
    	provider :seven_digital, 'consumer_key', 'consumer_secret'
    end

You will obviously have to put in your key and secret, which you can get from https://api-signup.7digital.com/


After you have the gem running and the configuration is done, you can get to the follow url to log the user in:

	http://localhost:3000/auth/seven_digital

Now just follow the README at: https://github.com/intridea/omniauth
