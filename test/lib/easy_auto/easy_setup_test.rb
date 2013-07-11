require_relative '../../test_helper'

module EasyAuto
  class EasySetup
    def example
      puts "some text"
    end
  end
end

describe EasyAuto::EasySetup do

  subject { EasyAuto::EasySetup.new }
  before { @mock = MiniTest::Mock.new }

  it "should ask for your email and password" do
    -> { subject.example }.must_output "some text\n"
  end

  # it "should curl github to get your token" do

  # end

  # describe "creating the ~/.easy-auto folder" do

  #   it "should check to see if the folder exists already" do

  #   end

  #   it "should create the folder if it doesn't exist" do

  #   end
  # end

  # describe "creating the config.yml file" do

  #   it "should check to see if the file exists" do

  #   end

  #   it "should create the file if it doesn't exist" do

  #   end

  #   it "should write a .yml with your auth info to ~/.easy-auto/config.yml" do

  #   end
  # end
end
