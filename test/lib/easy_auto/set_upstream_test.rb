require_relative '../../test_helper'

describe EasyAuto::SetUpstream do

  subject { EasyAuto::SetUpstream.new('test-123', 'master') }
  let(:git) { subject.git }

  it 'requires the git wrapper' do
    subject.must_respond_to :git
  end

  it 'returns the git class' do
    git.must_be_same_as EasyAuto::Git
  end
end

SUMock = Class.new(EasyAuto::SetUpstream) do
  def initialize mock, new_branch, upstream_branch
    @mock = mock
    @new_branch = new_branch
    @upstream_branch = upstream_branch
  end

  def set
    @mock.perform "push -u #{new_branch} origin/#{upstream_branch}"
  end
end

describe SUMock do
  before do
    @mock = MiniTest::Mock.new
  end

  subject { SUMock.new @mock, 'test-123', 'upstream-branch' }

  it 'should correctly set the upstream branch' do
    new_branch = 'test-123'
    upstream_branch = 'upstream-branch'
    @mock.expect :perform, true, ["push -u #{new_branch} origin/#{upstream_branch}"]
    subject.set
    @mock.verify
  end
end
