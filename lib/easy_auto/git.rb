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

    def self.abbrev_ref
      "rev-parse --abbrev-ref"
    end

    def self.current_branch_name
      perform "#{abbrev_ref} HEAD"
    end

    def self.remote_branch
      perform "#{abbrev_ref} --symbolic-full-name @{u}"
    end

    def self.delete_local_branch branch_name
      checkout_master
      perform "branch -D #{branch_name}"
    end

    def self.delete_local_and_remote_branch branch_name
      delete_local_branch branch_name
      delete_remote_branch branch_name
    end

    def self.delete_remote_branch branch_name
      perform "push origin :#{branch_name}"
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

    def self.create_and_switch_to branch_name, tracking_branch = nil
      perform "checkout -b #{branch_name} #{tracking_branch}"
    end
  end
end
