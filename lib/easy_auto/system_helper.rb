module EasyAuto
  module SystemHelper
    def system command
      `#{command}`.strip
    end
  end
end
