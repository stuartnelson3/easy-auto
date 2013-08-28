require_relative '../../test_helper'

module EasyAuto::ClientWrapper
  def client
    OpenStruct.new login: 'sample-user'
  end
end

class PRMock < EasyAuto::PullRequest
  def initialize mock
    @mock = mock
  end

  def remote_paths
    "origin\tgit@github.com:repo_owner/easy-auto.git (fetch)\norigin\tgit@github.com:repo_owner/easy-auto.git (push)"
  end

  def head
    'awesome-new-feature'
  end

  def cli_send browser_open_command
    @mock.call browser_open_command
  end
end

describe EasyAuto::PullRequest do
  before do
    @mock = MiniTest::Mock.new
  end

  subject { PRMock.new @mock }

  it 'states what branch is requesting to be merged into what branch' do
    repo_owner = 'repo_owner'
    repo_name = 'easy-auto'
    pr_branch = 'awesome-new-feature'
    -> { subject.state_merge_intent }.must_output "Preparing pull request:\n#{repo_owner}/#{repo_name}/#{pr_branch} -> #{repo_owner}/#{repo_name}/master\n"
  end

  it 'requires the git wrapper' do
    subject.must_respond_to :git
  end

  it 'requires the client wrapper' do
    subject.must_respond_to :client
  end

  it 'returns the git class' do
    subject.git.must_be_same_as EasyAuto::Git
  end

  it 'finds the right username' do
    subject.username.must_equal 'sample-user'
  end

  it 'returns a string for repo_name' do
    subject.repo_name.must_be_instance_of String
  end

  it 'returns the first match' do
    subject.repo_name.must_equal 'easy-auto'
  end

  it 'finds the repo name from #remote_paths' do
    subject.repo_owner.must_equal 'repo_owner'
  end

  it 'returns the right repo_path' do
    subject.repo_path.must_equal 'repo_owner/easy-auto'
  end

  it 'opens the right web address' do
    pr_number = 10
    @mock.expect :call, true, ["open 'https://github.com/#{subject.repo_path}/pull/#{pr_number}'"]
    subject.open_in_browser pr_number
  end
end
