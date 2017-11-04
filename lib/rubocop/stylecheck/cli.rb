module Rubocop
  module Stylecheck
    module Cli
      class << self
        def options
          options = ["--fail-level", "refactor"]
          options += ["--rails"] if defined?(Rails)
          options
        end

        def options_with_auto_correct
          options + ["--auto-correct"]
        end

        def options_with_cop
          options + ["--display-cop-names"]
        end
      end
    end
  end
end
