require_relative '../../test_helper'

Client = Class.new do
  def login
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

  it 'gets the username from the client' do
    subject.client.login.must_equal 'test@example.com'
  end

  it 'gets the user name correctly' do
    subject.username.must_equal 'test'
  end

  it 'correctly requires the system helper' do
    subject.must_respond_to :cli_send
  end

  # it 'sends the right cli_send messages in #set_remote' do
  # end
end
