require 'open3'

module EasyAuto
  module SystemHelper
    def cli_send command
      output, error, status = Open3.capture3 command
      output.strip
    end
  end
end
