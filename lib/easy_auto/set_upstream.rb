require 'easy_auto/system_helper'
require 'easy_auto/git_wrapper'

module EasyAuto
  class SetUpstream
    include SystemHelper
    include GitWrapper

    def set
      cli_send "git push -u #{remote} #{branch_name}"
    end

    def remote
      git.remote
    end

    def branch_name
      git.current_branch_name
    end
  end
end
