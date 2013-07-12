require 'easy_auto/system_helper'
require 'easy_auto/easy_utilities'
require 'easy_auto/client_wrapper'
require 'easy_auto/git_wrapper'

module EasyAuto
  class CreateRepo
    include SystemHelper
    include EasyUtilities
    include ClientWrapper
    include GitWrapper
    attr_accessor :repo_name
    attr_reader :password

    def run
      if remote_exists?
        puts "remote already exists!", "aborting!"
      else
        create_remote
      end
    end

    def login
      client.login
    end

    def remote_exists?
      !git.remote_branch.empty?
    end

    def username
      login.split("@").first
    end

    def create_remote
      cli_send "git init"
      create_repo
      set_remote
    end

    def set_remote
      cli_send "git add -A"
      cli_send "git commit -m 'first commit'"
      cli_send "git remote add origin git@github.com:#{username}/#{repo_name}.git"
      cli_send "git push -u origin master"
    end

    def create_repo
      puts "creating repo for username: #{login}"
      client.create_repo get_repo_name
    end

    def get_repo_name
      puts 'what would you like to name the remote repo?'
      self.repo_name = gets.strip
    end
  end
end
