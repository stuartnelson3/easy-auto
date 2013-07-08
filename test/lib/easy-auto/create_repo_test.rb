require_relative '../../test_helper'
require './lib/easy-auto/create-repo'

describe EasyAuto::CreateRepo do

  subject { EasyAuto::CreateRepo.new }
  let(:get_github_email) { 'test@example.com' }

  it 'sets the email' do
    subject.email == 'test@example.com'
  end

  it 'returns the right username' do
    subject.username == 'test'
  end
end
