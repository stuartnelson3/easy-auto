module EasyAuto
  class CreateRepo
    attr_accessor :repo_name
    attr_reader :password

    def run
      set_password
      create_remote unless remote_exists?
    end

    def username
      email.split("@").first
    end

    def get_github_email
      `git config --get user.email`.strip
    end

    def email
      @email ||= get_github_email
    end

    def set_password
      puts "enter your password for #{email}"
      @password = gets.strip
    end

    def remote_exists?
      !`git branch -r`.empty?
    end

    def create_remote
      `git init`
      create_repo
      set_remote
    end

    def set_remote
      `git commit -m "first commit"`
      `git remote add origin git@github.com:#{username}/#{repo_name}.git`
      `git push -u origin master`
    end

    def create_repo
      puts "creating repo with username: #{email}"
      puts "and password: #{password}"
      client.create_repo get_repo_name
    end

    def get_repo_name
      puts 'what would you like to name the remote repo?'
      self.repo_name = gets.strip
    end

    def client
      Octokit::Client.new login: username, password: password
    end
  end
end
