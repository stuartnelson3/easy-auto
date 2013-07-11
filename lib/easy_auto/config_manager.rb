require 'yaml'

module EasyAuto
  class ConfigManager
    attr_accessor :config
    attr_accessor :github_email
    attr_accessor :github_token

    def initialize config_contents
      self.config = config_contents
      config.each do |k,v|
        # e.g., foo: "bar" translates to self.foo = "bar"
        setter = "#{k}="
        send(setter, v) if respond_to? setter
      end
    end

    def self.read_yml
      new load_config
    end

    def set key, value
      send("#{key}=", value)
      config.merge!(key => value)
      File.write config_file, YAML.dump(config)
    end

    def load_config
      YAML.load_file config_file
    rescue Errno::ENOENT
      create_config_file
      {}
    end

    def create_config_file
      check_dir_existence
      check_file_existence
    end

    def check_dir_existence
      unless Dir.exists? config_dir
        Dir.mkdir config_dir
      end
    end

    def config_dir
      File.expand_path "~/.easy-auto"
    end

    def check_file_existence
      unless File.exists? config_file
        File.write config_file, attributes
      end
    end

    def config_file
      File.join config_dir, "config.yml"
    end
  end
end
