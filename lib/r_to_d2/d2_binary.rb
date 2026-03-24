module RToD2
  class D2Binary
    D2_VERSION = "0.7.1"
    PLATFORM = Gem::Platform.new(ENV.fetch("GEM_PLATFORM")).freeze

    class UnsupportedPlatform < StandardError; end

    class << self
      def cpu
        case PLATFORM.cpu
        when /x86_64|x64/ then "amd64"
        when /arm|aarch64/ then "arm64"
        else
          raise UnsupportedPlatform, "Unsupported CPU `#{PLATFORM.cpu}`! Supported are: arm64, aarch64, x86_64, x64"
        end
      end

      def os
        case PLATFORM.os
        when /linux/ then "linux"
        when /darwin/ then "macos"
        when /mswin|mingw/ then "windows"
        else
          raise UnsupportedPlatform, "Unsupported OS `#{PLATFORM.os}`! Supported are: darwin, linux, mswin, mingw"
        end
      end

      def executable
        case os
        when "windows" then "d2.exe"
        else "d2"
        end
      end

      def relative_path
        "vendor/#{os}/#{cpu}/#{executable}"
      end

      def absolute_path
        RToD2.root.join(relative_path)
      end
    end

  end
end
