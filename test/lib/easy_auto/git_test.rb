require_relative '../../test_helper'
require './lib/easy_auto/git'

describe EasyAuto::Git do

  subject { EasyAuto::Git }

  it 'responds to :cli_send (use extend!)' do
    subject.must_respond_to :cli_send
  end
end
