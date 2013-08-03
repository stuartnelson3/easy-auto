require_relative '../../test_helper'

Client = Class.new do
  def login
    'test-user@example.com'
  end
end

CreateRepoMock = Class.new(EasyAuto::CreateRepo) do
  def initialize mock
    @mock = mock
  end

  def git
    @mock
  end

  def client
    Client.new
  end

  def repo_name
    'test-repo'
  end
end

describe EasyAuto::CreateRepo do
  before do
    @mock = MiniTest::Mock.new
  end
  subject { CreateRepoMock.new @mock }

  it 'gets the username from the client' do
    subject.client.login.must_equal 'test-user@example.com'
  end

  it 'gets the user name correctly' do
    subject.username.must_equal 'test-user'
  end

  it 'sends the right cli_send messages in #set_remote' do
    username = 'test-user'
    repo_name = 'test-repo'
    @mock.expect :perform, true, ["add -A"]
    @mock.expect :perform, true, ["commit -m 'first commit'"]
    @mock.expect :perform, true, ["remote add origin git@github.com:#{username}/#{repo_name}.git"]
    @mock.expect :perform, true, ["push -u origin master"]
    subject.set_remote
    @mock.verify
  end
end
