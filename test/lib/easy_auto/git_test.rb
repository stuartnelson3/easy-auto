require_relative '../../test_helper'

describe EasyAuto::Git do

  subject { EasyAuto::Git }

  it 'responds to :cli_send (use extend!)' do
    subject.must_respond_to :cli_send
  end
end
