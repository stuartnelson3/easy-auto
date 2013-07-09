require_relative '../../test_helper'
require './lib/easy_auto/create_repo'

describe EasyAuto::CreateRepo do

  subject { EasyAuto::CreateRepo.new }
  let(:get_github_email) { 'test@example.com' }

  it 'sets the email' do
    subject.email == 'test@example.com'
  end

  it 'returns the right username' do
    subject.username == 'test'
  end

  it 'correctly requires the system helper' do
    subject.must_respond_to :cli_send
  end
end
