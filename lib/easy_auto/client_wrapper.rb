require 'easy_auto/config_manager_wrapper'

module EasyAuto
  class Github
    extend ConfigManagerWrapper

    def self.client
      Octokit::Client.new login: config_manager.github_email, oauth_token: config_manager.github_token
    end
  end

  module ClientWrapper
    def client
      Github.client
    end
  end
end
