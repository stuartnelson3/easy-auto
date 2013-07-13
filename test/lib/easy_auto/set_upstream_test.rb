require_relative '../../test_helper'

describe EasyAuto::SetUpstream do
  subject { EasyAuto::SetUpstream.new }

  let(:git) { subject.git }

  after do
    # git.perform "git push origin :test-123"
  end

  it 'requires the git wrapper' do
    subject.must_respond_to :git
  end

  it 'returns the git class' do
    subject.git.must_be_same_as EasyAuto::Git
  end
end
