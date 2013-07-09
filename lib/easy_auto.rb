require 'octokit'

trap("INT") { puts "\nexiting"; exit 1 }

module EasyAuto; end

require "easy_auto/create_repo"
require "easy_auto/pull_request"
require "easy_auto/set_upstream"
