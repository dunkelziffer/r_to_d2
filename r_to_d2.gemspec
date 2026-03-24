require_relative "lib/r_to_d2/version"
require_relative "lib/r_to_d2/d2_binary"

Gem::Specification.new do |s|
  s.name = "r_to_d2"
  s.version = RToD2::VERSION
  s.platform = RToD2::D2Binary::PLATFORM
  s.license = "MIT"
  s.authors = ["Klaus Weidinger"]
  s.email = ["weidkl@gmx.de"]

  s.summary = "Ruby to D2. Convert diagrams to SVG and PNG via the compiled D2 binary."
  s.description = s.summary
  s.homepage = "https://github.com/dunkelziffer/r_to_d2"

  s.metadata = {
    "source_code_uri" => s.homepage,
    "homepage_uri" => s.homepage,
    "rubygems_mfa_required" => "true",
  }

  gemspec = File.basename(__FILE__)
  platform_independent_files = `git ls-files`
    .split("\n")
    .reject { |f| File.symlink?(f) }
    .reject { |f| f == gemspec }
    .reject { |f| f.start_with?(*%w[.github/ bin/ spec/ vendor/ .gem_release.yml .gitignore .rspec Gemfile Gemfile.lock]) }

  s.files = platform_independent_files
  s.files << RToD2::D2Binary.relative_path if s.platform != "ruby"
  s.require_paths = ["lib"]

  s.bindir = "exe"
  s.executables = []

  s.required_ruby_version = ">= 3.2.0"
end
