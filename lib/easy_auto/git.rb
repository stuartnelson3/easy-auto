require 'easy_auto/system_helper'

module EasyAuto
  class Git
    include SystemHelper

    def self.current_branch_name
      system "git rev-parse --abbrev-ref HEAD"
    end

    def self.checkout_master
      system "git checkout master"
    end

    def self.pull
      system "git pull"
    end

    def self.create_and_switch_to branch_name
      system "git checkout -b #{branch_name}"
    end
  end
end
