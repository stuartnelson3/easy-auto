require 'open3'

module EasyAuto
  module SystemHelper
    def cli_send command
      output, error, status = Open3.capture3 command
      output.strip
    end

    def os
      cli_send "uname"
    end

    def check_install software_name
      software_path = cli_send "which #{software_name}"
      if software_path.empty?
        puts "no #{software_name} detected!"
        if os == "Darwin"
          puts "installing with brew.."
          cli_send "brew install #{software_name}"
          puts "installed #{software_name}!"
        else
          puts "install #{software_name} and try again!"
          exit 1
        end
      end
    end
  end
end
