require 'easy_auto/set_upstream'
require 'easy_auto/git'
require 'easy_auto/easy_utilities'

module EasyAuto
  class CreateBranch
    include GitWrapper

    def run
      git.checkout_master
      git.pull
      new_branch = ask_new_branch_name
      git.create_and_switch_to new_branch
      new_branch_message if set_upstream
    end

    def set_upstream
      SetUpstream.new.set
    end

    def ask_new_branch_name
      ask "what would you like to name the new branch?"
    end

    def new_branch_message
      puts "successfully created branch and set upstream remote!"
    end
  end
end
