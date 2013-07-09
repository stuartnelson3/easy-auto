require_relative '../../test_helper'
require './lib/easy_auto/easy_utilities'

module EasyAuto
  UtilitiesMock = Class.new do
    include EasyUtilities
  end
end

describe EasyAuto::EasyUtilities do

  subject { EasyAuto::UtilitiesMock.new }

  it "should give the class access to :hidden_input" do
    subject.must_respond_to :hidden_input
  end

  it "should give the class access to :ask" do
    subject.must_respond_to :ask
  end
end
