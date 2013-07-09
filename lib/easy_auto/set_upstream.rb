require 'easy_auto/system_helper'
require 'easy_auto/git'

module EasyAuto
  class SetUpstream
    include SystemHelper
    include Git

    def set
      system "git branch -u origin/#{branch_name}"
    end

    def branch_name
      current_branch_name
    end
  end
end
