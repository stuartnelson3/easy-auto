require 'easy_auto/system_helper'

module EasyAuto
  class CreateRepo
    include SystemHelper
    attr_accessor :repo_name
    attr_reader :password

    def run
      set_password
      create_remote unless remote_exists?
    end

    def username
      email.split("@").first
    end

    def get_github_email
      system "git config --get user.email"
    end

    def email
      get_github_email
    end

    def set_password
      puts "enter your password for #{email}"
      @password = gets.strip
    end

    def remote_exists?
      output = system "git branch -r"
      !output.empty?
    end

    def create_remote
      system "git init"
      create_repo
      set_remote
    end

    def set_remote
      system "git commit -m 'first commit'"
      system "git remote add origin git@github.com:#{username}/#{repo_name}.git"
      system "git push -u origin master"
    end

    def create_repo
      puts "creating repo with username: #{email}"
      puts "and password: #{password}"
      client.create_repo get_repo_name
    end

    def get_repo_name
      puts 'what would you like to name the remote repo?'
      self.repo_name = gets.strip
    end

    def client
      Octokit::Client.new login: username, password: password
    end
  end
end
