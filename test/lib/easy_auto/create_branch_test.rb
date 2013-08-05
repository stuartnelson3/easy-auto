require_relative '../../test_helper'

CBMock = Class.new(EasyAuto::CreateBranch) do
  def set_upstream
    true
  end

  def pull; end
  def checkout_master; end
  def new_branch_message; end
end

describe EasyAuto::CreateBranch do

  subject { CBMock.new 'test-123' }
  let(:git) { subject.git }

  after do
    git.checkout_master
    git.delete_local_branch 'test-123'
  end

  it 'has easy utilities included' do
    subject.must_respond_to :ask
  end

  describe 'usage' do
    it 'should acknowledge -h' do
      subject = CBMock.new '-h'
      subject.help_request?.must_equal true
    end

    it 'should acknowledge --help' do
      subject = CBMock.new '--help'
      subject.help_request?.must_equal true
    end

    it 'should accept branch names' do
      subject = CBMock.new 'new-branch-name'
      subject.help_request?.must_equal false
    end
  end

  describe 'command line invocation' do
    # add webmock to stop network io
    # do stuff with ARGV in create-branch bin script
    # get up the nerve to dm bernhardt on twitter to pair with you

    it 'should return usage when invoked without arguments' do
      -> { CBMock.new(nil, nil).run }.must_output "usage: create-branch <new-branch> <OPTIONAL: branch-to-track>.\n"
    end

    # it 'should return usage when invoked with too many arguments' do
    #   subject = CBMock.new 'arg', 'too', 'many'
    #   -> { subject.run }.must_output "usage: create-branch <new-branch> <OPTIONAL: branch-to-track>.\n"
    # end

    it 'should return usage when invoked with -h' do
      subject = CBMock.new '-h'
      -> { subject.run }.must_output "usage: create-branch <new-branch> <OPTIONAL: branch-to-track>.\n"
    end

    it 'should return usage when invoked with --help' do
      subject = CBMock.new '--help'
      -> { subject.run }.must_output "usage: create-branch <new-branch> <OPTIONAL: branch-to-track>.\n"
    end

    it 'should accept one param and set the branch to that' do
      subject = CBMock.new 'test-123'
      subject.run
      git.current_branch_name.must_equal 'test-123'
    end
  end
end

# CBSetUpstream = Class.new(CBMock) do
#   def initialize mock
#     @mock = mock
#     @upstream_branch = 'test-123'
#   end

#   def set_upstream
#     @mock.set @upstream_branch
#   end
# end

# describe CBSetUpstream do
#   before do
#     @mock = MiniTest::Mock.new
#   end
#   subject { CBSetUpstream.new @mock }

#   it 'should work' do
#     upstream_branch = 'test-123'
#     @mock.expect :set, true, [upstream_branch]
#     subject.run
#     @mock.verify
#   end
# end
