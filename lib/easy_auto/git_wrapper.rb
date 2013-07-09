require 'easy_auto/git'

module EasyAuto
  module GitWrapper
    def git
      @git ||= Git
    end
  end
end
