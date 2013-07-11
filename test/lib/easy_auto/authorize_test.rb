require_relative '../../test_helper'

AuthMock = Class.new(EasyAuto::Authorize) do
  def github_curl
    "{\"token\": \"token123\"}"
  end
end

describe EasyAuto::Authorize do

  subject { AuthMock.new }

  it "should set the token correctly" do
    subject.generate_token
    subject.token.must_equal "token123"
  end
end
