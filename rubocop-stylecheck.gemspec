lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "rubocop/stylecheck/version"

Gem::Specification.new do |spec|
  spec.name          = "rubocop-stylecheck"
  spec.version       = Rubocop::Stylecheck::VERSION
  spec.authors       = ["Krzysztof Wawer"]
  spec.email         = ["krzysztof.wawer@gmail.com"]

  spec.summary       = "Automatic style check for ruby projects"
  spec.description   = "Adds rake tasks for checking ruby style"
  spec.homepage      = "https://github.com/alterans/rubocop-stylecheck"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_dependency "rake", "~> 10.0"
  spec.add_dependency "rubocop", "~> 0.51"
end
