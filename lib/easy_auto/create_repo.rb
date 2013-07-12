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
      git_init
      create_repo
      set_remote
    end

    def git_init
      git.init
    end

    def add_files
      git.perform "git add -A"
    end

    def first_commit
      git.perform "git commit -m 'first commit'"
    end

    def add_remote
      git.perform "git remote add origin git@github.com:#{username}/#{repo_name}.git"
    end

    def first_push
      git.perform "git push -u origin master"
    end

    def set_remote
      add_files
      first_commit
      add_remote
      first_push
    end

    def create_repo
      puts "creating repo for username: #{login}"
      client.create_repo get_repo_name
    end

    def get_repo_name
      self.repo_name = ask_repo_name
    end

    def ask_repo_name
      ask 'what would you like to name the remote repo?'
    end
  end
end
