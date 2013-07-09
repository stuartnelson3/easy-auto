require_relative '../../test_helper'
require './lib/easy_auto/git_wrapper'

module EasyAuto
  GitMock = Class.new do
    include GitWrapper
  end
end

describe EasyAuto::GitWrapper do

  subject { EasyAuto::GitMock.new }

  it "should give the class access to :git" do
    subject.must_respond_to :git
  end

  it "should return the EasyAuto::Git class" do
    subject.git.must_equal EasyAuto::Git
  end
end
