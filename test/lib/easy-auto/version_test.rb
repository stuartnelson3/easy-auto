require_relative '../../test_helper'

describe EasyAuto do
  it "must be defined" do
    EasyAuto::VERSION.wont_be_nil
  end
end
