require 'json'
require 'easy_auto/system_helper'
require 'easy_auto/config_manager_wrapper'

module EasyAuto
  class Authorize
    include SystemHelper
    include ConfigManagerWrapper
    attr_accessor :email
    attr_accessor :password
    attr_accessor :token

    def run
      get_credentials
      generate_token
      store_token
    end

    def store_token
      config_manager.set :github_email, email
      config_manager.set :github_token, token
    end

    def get_credentials
      self.email = get_email
      self.password = get_password
    end

    def get_email
      puts "what is your github email account?"
      gets.strip
    end

    def get_password
      puts "enter your password for #{email}. this will not be stored."
      hidden_input
    end

    def generate_token
      self.token = JSON.parse(github_curl)['token']
    end

    def github_curl
      cli_send %Q(curl -u '#{username}:#{password}' -d '{"scopes": ["repo"], "notes": "Easy Auto"}' https://api.github.com/authorizations)
    end
  end
end
