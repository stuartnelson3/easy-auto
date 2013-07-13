require 'easy_auto/system_helper'

module EasyAuto
  class Git
    extend SystemHelper

    def self.perform command
      cli_send "git #{command}"
    end

    def self.init
      perform "init"
    end

    def self.current_branch_name
      perform "rev-parse --abbrev-ref HEAD"
    end

    def self.remote_branch
      perform "branch -r"
    end

    def self.delete_branch branch_name
      checkout_master
      perform "branch -D #{branch_name}"
    end

    def self.remote
      perform "remote"
    end

    def self.checkout_master
      perform "checkout master"
    end

    def self.pull
      perform "pull"
    end

    def self.create_and_switch_to branch_name
      perform "checkout -b #{branch_name}"
    end
  end
end
