require_relative "d2_binary"
require "open3"

module RToD2
  class Converter

    class << self
      def to_svg(text)
        stdout_str, stderr_str, status = Open3.capture3(RToD2::D2Binary.absolute_path.to_s, '-', '-', stdin_data: text)

        if status.success?
          stdout_str
        else
          warn "Error: #{stderr_str}"
        end
      end
    end

  end
end
