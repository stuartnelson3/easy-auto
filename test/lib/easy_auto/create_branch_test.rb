require_relative '../../test_helper'

CBMock = Class.new(EasyAuto::CreateBranch) do
  def ask_new_branch_name
    'test-123'
  end

  def set_upstream
    true
  end

  def pull; end
  def checkout_master; end
  def new_branch_message; end
end

describe EasyAuto::CreateBranch do

  subject { CBMock.new }
  let(:git) { subject.git }

  after do
    git.delete_local_branch 'test-123'
  end

  it 'should create the test branch' do
    subject.run
    git.current_branch_name.must_equal 'test-123'
  end

  it 'has easy utilities included' do
    subject.must_respond_to :ask
  end
end
