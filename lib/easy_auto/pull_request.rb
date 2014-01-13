require 'easy_auto/easy_utilities'
require 'easy_auto/git_wrapper'
require 'easy_auto/client_wrapper'

module EasyAuto
  class PullRequest
    include EasyUtilities
    include GitWrapper
    include ClientWrapper
    include SystemHelper
    attr_accessor :title, :body

    def run
      state_merge_intent
      ask_title
      ask_body
      push_changes
      resp = client.create_pull_request(repo_path, base, head, title, body)
      pr_number = resp.attrs[:number]
      open_in_browser pr_number
    end

    def open_in_browser pr_number
      cli_send "open 'https://github.com/#{repo_path}/pull/#{pr_number}'"
    end

    def state_merge_intent
      puts "Preparing pull request:"
      puts "#{repo_owner}/#{repo_name}/#{head} -> #{repo_owner}/#{repo_name}/master"
    end

    def ask_title
      self.title = ask "Title:"
    end

    def ask_body
      self.body = ask "Description:"
    end

    def base
      'master'
    end

    def head
      git.current_branch_name
    end

    def repo_name
      remote_paths.match(/\/(.+)\.git/)[1]
    end

    def repo_owner
      (origin_owner || any_owner)[1]
    end

    def repo_path
      "#{repo_owner}/#{repo_name}"
    end

    def push_changes
      git.perform "push"
    end

    def remote_paths
      git.perform "remote -v"
    end

    private
    def any_owner
      remote_paths.match(/:(.+)\//)
    end

    def origin_owner
      remote_paths.match(/origin.+:(.+)\//)
    end
  end
end
