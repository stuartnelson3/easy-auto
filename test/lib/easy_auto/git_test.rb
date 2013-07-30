require_relative '../../test_helper'

describe EasyAuto::Git do

  subject { EasyAuto::Git }

  it 'responds to :cli_send (use extend!)' do
    subject.must_respond_to :cli_send
  end

  describe '#delete_local_and_remote_branch' do

    before do
      subject.perform 'checkout -b test-123'
      subject.perform 'push -u origin test-123'
    end

    it 'deletes the local and remote branch' do
      subject.current_branch_name.must_equal 'test-123'
      subject.remote_branch.must_include 'test-123'
      subject.delete_local_and_remote_branch 'test-123'
      subject.current_branch_name.must_include 'master'
      subject.remote_branch.wont_include 'test-123'
    end
  end
end
