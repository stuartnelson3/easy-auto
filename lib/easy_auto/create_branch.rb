require 'easy_auto/set_upstream'
require 'easy_auto/git'
require 'easy_auto/easy_utilities'

module EasyAuto
  class CreateBranch
    include GitWrapper
    include EasyUtilities
    attr_reader :new_branch
    attr_reader :origin_branch
    attr_reader :wrong_usage

    def initialize *args
      @wrong_usage = args.count < 1 || args.count > 2
      @new_branch = args.pop
      @origin_branch = args.pop || 'master'
    end

    def run
      return usage if wrong_usage || help_request?
      checkout_master
      pull
      git.create_and_switch_to new_branch
      new_branch_message if set_upstream
    end

    def help_request?
      %w{-h --help}.include? new_branch
    end

    def usage
      puts 'usage: create-branch <new-branch> <OPTIONAL: branch-to-track>.'
    end

    def checkout_master
      git.checkout_master
    end

    def pull
      git.pull
    end

    def set_upstream
      SetUpstream.new(new_branch, origin_branch).set
    end

    def new_branch_message
      puts "successfully created branch and set upstream remote!"
    end
  end
end
