require_relative '../../test_helper'

SetupMock = Class.new(EasyAuto::EasySetup) do
  def initialize os
    @os = os
  end

  def os
    @os
  end

  def system_exit; end
end

describe EasyAuto::EasySetup do
  describe 'checking user os' do
    it 'should reject non-osx/linux machines' do
      subject = SetupMock.new 'not-unix'
      -> { subject.os_check }.must_output "Sorry, your OS isn't supported.\n"
    end

    it 'should accept linux machines' do
      subject = SetupMock.new 'Linux'
      -> { subject.os_check }.must_output "You have an acceptable os!\n"
    end

    it 'should accept linux machines' do
      subject = SetupMock.new 'Darwin'
      -> { subject.os_check }.must_output "You have an acceptable os!\n"
    end
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
