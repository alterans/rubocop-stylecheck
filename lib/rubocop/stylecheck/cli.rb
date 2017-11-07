module Rubocop
  module Stylecheck
    module Cli
      class << self
        def run(options)
          if Rubocop::Stylecheck.direct
            direct_run(options)
          else
            run_via_sh(options)
          end
        end

        def direct_run(options)
          require "rubocop"
          require "benchmark"

          cli = RuboCop::CLI.new
          result = 0

          time = Benchmark.realtime do
            result = cli.run(options)
          end

          puts "Finished in #{time} seconds" if cli.options[:debug]
          exit result
        end

        def run_via_sh(options)
          system "bundle exec rubocop #{options.join(' ')}" do |ok, _res|
            abort "Fix code style errors" unless ok
          end
        end

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
