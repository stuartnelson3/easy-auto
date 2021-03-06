require 'easy_auto/config_manager_wrapper'
require 'easy_auto/system_helper'

module EasyAuto
  class EasySetup
    include ConfigManagerWrapper
    include SystemHelper
    attr_accessor :email
    attr_accessor :password

    def run
      setup_message
      os_check
      check_git_install
      check_git_extras_install
      check_authorization
      success_message
    end

    def system_exit
      exit 1
    end

    def check_authorization
      Octokit::Client.new(login: config_manager.github_email, access_token: config_manager.github_token).user
    rescue Faraday::Error::ConnectionFailed => e
      p e
      p "It appears you had an SSL error. Read http://mislav.uniqpath.com/2013/07/ruby-openssl/ to fix it."
    rescue
      puts "make sure you have octokit installed and have run easy-authorize!"
      system_exit
    end

    def success_message
      puts "all set!"
    end

    def check_git_install
      check_install "git"
    end

    def check_git_extras_install
      check_install "git-extras"
    end

    def os_check
      if os == "Linux" || os == "Darwin"
        puts "You have an acceptable os!"
      else
        puts "Sorry, your OS isn't supported."
        system_exit
      end
    end

    def setup_message
      puts "this will check to make sure your computer is set up!"
    end
  end
end
