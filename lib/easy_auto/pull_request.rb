require 'easy_auto/easy_utilities'
require 'easy_auto/git_wrapper'
require 'easy_auto/client_wrapper'

module EasyAuto
  class PullRequest
    include EasyUtilities
    include GitWrapper
    include ClientWrapper
    attr_accessor :title, :body

    def run
      ask_title
      ask_body
      client.create_pull_request(repo_name, base, head, title, body)
    end

    def ask_title
      self.title = ask "what would you like the title to be?"
    end

    def ask_body
      self.body = ask "what would you like the body to be?"
    end

    def base
      git.remote_branch
    end

    def head
      git.current_branch_name
    end

    def repo_name
      remote_paths.match(/\/(.+\.git)/)[1]
    end

    def remote_paths
      git.perform "remote -v"
    end
  end
end
