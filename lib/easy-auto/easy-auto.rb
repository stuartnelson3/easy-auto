module EasyAuto
  class CreateRepo
    attr_accessor :repo_name

    def initialize
      @email = get_email
      puts "enter your password for #@email"
      @password = gets.strip
      login_user
      create_remote unless remote_exists?
    end

    def username
      @email.split("@").first
    end

    def get_username
      `git config --get user.email`.strip
    end

    def remote_exists?
      !`git branch -r`.empty?
    end

    def create_remote
      `git init`
      create_repo get_repo_name
      set_remote
    end

    def set_remote
      `git commit -m "first commit"`
      `git remote add origin git@github.com:#{username}/#{repo_name}.git`
      `git push -u origin master`
    end

    def create_repo repo_name
      puts "creating repo with username: #@email"
      puts "and password: #@password"
      @client.create_repo get_repo_name
    end

    def get_repo_name
      puts 'what would you like to name the remote repo?'
      self.repo_name = gets.strip
    end

    def login_user
      @client = Octokit::Client.new login: @username, password: @password
    end
  end
end
