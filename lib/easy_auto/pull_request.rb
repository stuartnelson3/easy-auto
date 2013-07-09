require 'easy_auto/easy_utilities'
require 'easy_auto/git_wrapper'

module EasyAuto
  class PullRequest
    include EasyUtilities
    include GitWrapper
    include SystemHelper
    attr_accessor :title, :body

    def run
      ask_title
      ask_body
      Octokit::Client.create_pull_request(repo_name, base, head, title, body)
    end

    def ask_title
      self.title = ask "what would you like the title to be?"
    end

    def ask_body
      self.body = ask "what would you like the body to be?"
    end

    def base
      cli_send "git branch -r"
    end

    def head
      git.current_branch_name
    end

    def repo_name
      remote.scan(/\/(.+\.git)/).first
    end

    def remote
      cli_send "git remote -v"
    end
  end
end
