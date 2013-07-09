require 'easy_auto/easy_utilities'
require 'easy_auto/git'

module EasyAuto
  class PullRequest
    include EasyUtilities
    include Git
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
      system "git branch -r"
    end

    def head
      current_branch_name
    end

    def repo_name
      remote.scan(/\/(.+\.git)/).first
    end

    def remote
      system "git remote -v"
    end
  end
end
