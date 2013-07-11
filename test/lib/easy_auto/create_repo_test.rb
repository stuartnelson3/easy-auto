require_relative '../../test_helper'

Client = Class.new do
  def email
    'test@example.com'
  end
end

class CreateRepoMock < EasyAuto::CreateRepo
  def client
    Client.new
  end
end

describe EasyAuto::CreateRepo do

  subject { CreateRepoMock.new }

  it 'sets the email' do
    subject.email.must_equal 'test@example.com'
  end

  it 'correctly requires the system helper' do
    subject.must_respond_to :cli_send
  end
end
