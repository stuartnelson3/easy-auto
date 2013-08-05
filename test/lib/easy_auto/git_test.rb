require_relative '../../test_helper'

GitMock = Class.new(EasyAuto::Git) do
  def self.perform command
    mock.send "git #{command}"
  end

  def self.mock
    @mock
  end

  def self.mock=(mock)
    @mock = mock
  end
end

describe EasyAuto::Git do

  subject { GitMock }

  before do
    @mock = MiniTest::Mock.new
    subject.mock = @mock
  end

  it 'responds to :cli_send (use extend!)' do
    subject.must_respond_to :cli_send
  end

  describe '#delete_local_and_remote_branch' do
    it 'uses the right git commands to delete the local and remote branch' do
      @mock.expect :send, true, ["git checkout master"]
      @mock.expect :send, true, ["git branch -D test-123"]
      @mock.expect :send, true, ["git push origin :test-123"]
      subject.delete_local_and_remote_branch 'test-123'
      @mock.verify
    end
  end

  describe '#create_and_switch_to' do
    it 'with one argument' do
      @mock.expect :send, true, ["git checkout -b test-123 "]
      subject.create_and_switch_to 'test-123'
      @mock.verify
    end

    it 'with two arguments' do
      @mock.expect :send, true, ["git checkout -b test-123 other-branch"]
      subject.create_and_switch_to 'test-123', 'other-branch'
      @mock.verify
    end
  end

  describe '#current_branch_name' do
    it 'uses the right git commands' do
      @mock.expect :send, true, ["git rev-parse --abbrev-ref HEAD"]
      subject.current_branch_name
      @mock.verify
    end
  end

  describe '#remote_branch' do
    it 'uses the right git commands' do
      @mock.expect :send, true, ["git rev-parse --abbrev-ref --symbolic-full-name @{u}"]
      subject.remote_branch
      @mock.verify
    end
  end
end
