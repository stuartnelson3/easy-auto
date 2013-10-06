require 'general_store'

module EasyAuto
  module ConfigManagerWrapper
    def config_manager
      @config_manager ||= GeneralStore.read '~/.easy-auto'
    end
  end
end
