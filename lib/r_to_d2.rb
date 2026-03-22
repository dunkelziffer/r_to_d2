require_relative "r_to_d2/version"
require "open3"

class R2D2
  class UnsupportedPlatform < StandardError; end

  def self.root
    Pathname.new(File.expand_path("..", __dir__))
  end

  def self.binary
    cpu = Gem::Platform.local.cpu
    os  = Gem::Platform.local.os

    platform = case os
    when /darwin/ then "darwin"
    when /linux/  then "linux"
    when /mswin|mingw/ then "windows"
    else
      raise UnsupportedPlatform, "Unsupported OS `#{os}`! Supported are: darwin, linux, mswin, mingw."
    end

    arch = case cpu
    when /arm64|aarch64/ then "arm64"
    when /x86_64/        then "amd64"
    else
      raise UnsupportedPlatform, "Unsupported CPU `#{cpu}`! Supported are: arm64, aarch64, x86_64."
    end

    executable = case platform
    when "windows" then "d2.exe"
    else
      "d2"
    end

    root.join('exe', "#{platform}-#{arch}-#{executable}")
  end

  def self.to_svg(text)
    stdout_str, stderr_str, status = Open3.capture3(binary.to_s, '-', '-', stdin_data: text)

    if status.success?
      stdout_str
    else
      warn "Error: #{stderr_str}"
    end
  end
end
