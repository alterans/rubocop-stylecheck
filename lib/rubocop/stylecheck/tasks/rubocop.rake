require "rubocop/stylecheck"
require "fileutils"

namespace :style do
  namespace :rubocop do
    desc "Run RuboCop with auto_correct"
    task :with_auto_correct do
      Rubocop::Stylecheck::Cli.run(
        Rubocop::Stylecheck::Cli.options_with_auto_correct
      )
    end

    desc "Run RuboCop without auto_correct"
    task :without_auto_correct do
      Rubocop::Stylecheck::Cli.run(
        Rubocop::Stylecheck::Cli.options_with_cop
      )
    end

    desc "Generate local RuboCop config"
    task :generate_local_config do
      template_config_path = Rubocop::Stylecheck.config_path
      project_config_path = Rubocop::Stylecheck.project_config_path

      if template_config_path && File.exist?(template_config_path)
        FileUtils.cp(template_config_path, project_config_path)
      else
        abort "Config file doesn't exist, please use" \
              "Robocop::Stylecheck.config_path = ..."
      end
    end
  end
end

desc "Check codestyle and fix common errors"
task :style do
  Rake::Task["style:rubocop:with_auto_correct"].invoke
end
