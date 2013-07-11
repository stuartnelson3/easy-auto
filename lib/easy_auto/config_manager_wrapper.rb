require 'easy_auto/config_manager'

module EasyAuto
  module ConfigManagerWrapper
    def config_manager
      @config_manager ||= ConfigManager.read_yml
    end
  end
end
