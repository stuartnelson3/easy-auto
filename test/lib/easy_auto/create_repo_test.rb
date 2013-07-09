require_relative '../../test_helper'

class CreateRepoMock < EasyAuto::CreateRepo
  def get_github_email
    'test@example.com'
  end
end

describe EasyAuto::CreateRepo do

  subject { CreateRepoMock.new }

  it 'sets the email' do
    subject.email.must_equal 'test@example.com'
  end

  it 'returns the right username' do
    subject.username == 'test'
  end

  it 'correctly requires the system helper' do
    subject.must_respond_to :cli_send
  end
end
