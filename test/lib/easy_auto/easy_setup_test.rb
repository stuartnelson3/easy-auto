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
end
