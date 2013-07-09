require_relative '../../test_helper'

class PRMock < EasyAuto::PullRequest
  def remote
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

  it 'returns a string for repo_name' do
    subject.repo_name.must_be_instance_of String
  end

  it 'returns the first match' do
    subject.repo_name.must_equal 'easy-auto.git'
  end
end
