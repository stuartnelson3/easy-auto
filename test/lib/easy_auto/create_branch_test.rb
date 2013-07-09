require_relative '../../test_helper'

describe EasyAuto::CreateBranch do

  subject { EasyAuto::CreateBranch.new }

  it 'has easy utilities included' do
    subject.must_respond_to :ask
  end
end
