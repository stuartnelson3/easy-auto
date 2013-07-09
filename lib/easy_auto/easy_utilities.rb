require 'io/console'

module EasyAuto
  module EasyUtilities
    def hidden_input
      $stdin.noecho(&:gets).strip
    end

    def ask string
      puts string
      gets.strip
    end
  end
end
