require 'easy_auto/system_helper'

module EasyAuto
  class SetUpstream
    include SystemHelper

    def set
      system "git branch -u origin/#{branch_name}"
    end

    def branch_name
      system "git rev-parse --abbrev-ref HEAD"
    end
  end
end
