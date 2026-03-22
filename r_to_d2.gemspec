# frozen_string_literal: true

require_relative "lib/r_to_d2/version"

Gem::Specification.new do |spec|
  spec.name = "r_to_d2"
  spec.version = R2D2::VERSION
  spec.authors = ["Klaus Weidinger"]
  spec.email = ["weidkl@gmx.de"]

  spec.summary = "Ruby to D2. Convert diagrams to SVG and PNG via the compiled D2 binary."
  spec.description = spec.summary
  spec.homepage = "https://github.com/dunkelziffer/r_to_d2"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.2.0"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ Gemfile .gitignore .rspec spec/ .github/])
    end
  end
  spec.bindir = "exe"
  spec.executables = ["darwin-amd64-d2", "darwin-arm64-d2", "linux-amd64-d2", "linux-arm64-d2", "windows-amd64-d2.exe", "windows-arm64-d2.exe"]
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
