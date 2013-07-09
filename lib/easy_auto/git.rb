module EasyAuto
  module Git
    def current_branch_name
      system "git rev-parse --abbrev-ref HEAD"
    end
  end
end
