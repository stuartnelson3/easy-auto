require 'easy_auto/config_manager_wrapper'

module EasyAuto
  class EasySetup
    include ConfigManagerWrapper
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

    def check_authorization
      Octokit::Client.new(login: config_manager.github_email, oauth_token: config_manager.github_token).user
    rescue
      puts "run easy-authorize to set up your github!"
      exit 1
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
      puts "lets check your operating system..."
      if os != "Linux" || os != "Darwin"
        puts "Sorry, your OS isn't supported."
        exit 1
      end
      puts "you have an acceptable os!"
    end

    def setup_message
      puts "this will configure your computer for easy-auto."
    end
  end
end
