require 'easy_auto/git_wrapper'

module EasyAuto
  class SetUpstream
    include GitWrapper
    attr_reader :upstream_branch

    def initialize upstream_branch
      @upstream_branch = upstream_branch
    end

    def set
      git.perform "push --set-upstream origin #{upstream_branch}"
    end
  end
end
