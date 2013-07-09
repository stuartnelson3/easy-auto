require 'easy_auto/system_helper'

module EasyAuto
  class Git
    extend SystemHelper

    def self.current_branch_name
      cli_send "git rev-parse --abbrev-ref HEAD"
    end

    def self.checkout_master
      cli_send "git checkout master"
    end

    def self.pull
      cli_send "git pull"
    end

    def self.create_and_switch_to branch_name
      cli_send "git checkout -b #{branch_name}"
    end
  end
end
