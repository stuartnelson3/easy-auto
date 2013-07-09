require_relative '../../test_helper'
require './lib/easy_auto/create_branch'

describe EasyAuto::CreateBranch do

  subject { EasyAuto::CreateBranch.new }

  it 'has easy utilities included' do
    subject.must_respond_to :ask
  end
end
