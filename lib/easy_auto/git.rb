require 'easy_auto/system_helper'

module EasyAuto
  class Git
    extend SystemHelper

    def self.perform command
      cli_send "#{command}"
    end

    def self.init
      perform "git init"
    end

    def self.current_branch_name
      perform "git rev-parse --abbrev-ref HEAD"
    end

    def self.remote_branch
      perform "git branch -r"
    end

    def self.delete_branch branch_name
      checkout_master
      perform "git branch -D #{branch_name}"
    end

    def self.remote
      perform "git remote"
    end

    def self.checkout_master
      perform "git checkout master"
    end

    def self.pull
      perform "git pull"
    end

    def self.create_and_switch_to branch_name
      perform "git checkout -b #{branch_name}"
    end
  end
end
