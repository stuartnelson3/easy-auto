require 'easy_auto/git_wrapper'

module EasyAuto
  class SetUpstream
    include GitWrapper
    attr_reader :new_branch
    attr_reader :upstream_branch

    def initialize new_branch, upstream_branch
      @new_branch = new_branch
      @upstream_branch = upstream_branch
    end

    def set
      git.perform "push --set-upstream origin #{new_branch}"
    end
  end
end
