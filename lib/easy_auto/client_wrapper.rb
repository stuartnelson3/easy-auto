module EasyAuto
  module ClientWrapper
    def client
      Octokit::Client.new login: email, password: password
    end

    def email
      # ENV['email']
    end

    def password
      # ENV['password']
    end
  end
end
