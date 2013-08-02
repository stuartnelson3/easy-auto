require_relative '../../test_helper'

describe EasyAuto::SetUpstream do

  subject { EasyAuto::SetUpstream.new('test-123', 'master') }
  let(:git) { subject.git }

  before do
    git.perform 'checkout -b test-123'
  end

  after do
    git.delete_local_and_remote_branch 'test-123'
  end

  it 'requires the git wrapper' do
    subject.must_respond_to :git
  end

  it 'returns the git class' do
    git.must_be_same_as EasyAuto::Git
  end

  it 'sets an upstream remote' do
    git.remote_branch.wont_include 'test-123'
    subject.set
    git.current_branch_name.must_equal 'test-123'
    git.remote_branch.must_include 'test-123'
  end
end

SUMock = Class.new(EasyAuto::SetUpstream) do
  def initialize mock, brancstuff

  end

  def set
    @mock.perform 'put in shit here'
  end
end
