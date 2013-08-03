require_relative '../../test_helper'

module EasyAuto::ClientWrapper
  def client
    OpenStruct.new login: 'sample-user'
  end
end

class PRMock < EasyAuto::PullRequest
  def remote_paths
    "origin\tgit@github.com:stuartnelson3/easy-auto.git (fetch)\norigin\tgit@github.com:stuartnelson3/easy-auto.git (push)"
  end
end

describe EasyAuto::PullRequest do

  subject { PRMock.new }

  it 'requires the git wrapper' do
    subject.must_respond_to :git
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

  it 'returns the right user_repo_path' do
    subject.user_repo_path.must_equal 'sample-user/easy-auto'
  end
end
