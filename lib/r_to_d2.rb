require_relative "r_to_d2/version"
require_relative "r_to_d2/d2_binary"
require_relative "r_to_d2/converter"


module RToD2

  def self.root
    Pathname.new(File.expand_path("..", __dir__))
  end

  def self.to_svg(text)
    RToD2::Converter.to_svg(text)
  end

end
