require_relative '../../test_helper'
require './lib/easy_auto/set_upstream'

describe EasyAuto::SetUpstream do
  subject { EasyAuto::SetUpstream.new }

  it 'requires the git wrapper' do
    subject.must_respond_to :git
  end

  it 'returns the git class' do
    subject.git.must_be_same_as EasyAuto::Git
  end
end
