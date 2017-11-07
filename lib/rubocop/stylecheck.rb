require "rubocop/stylecheck/version"

module Rubocop
  module Stylecheck
    class << self
      attr_accessor :config_path

      def project_config_path
        File.join(Dir.pwd, ".rubocop.yml")
      end
    end
  end
end

require "rubocop/stylecheck/cli"
require "rubocop/stylecheck/railtie" if defined?(Rails)
