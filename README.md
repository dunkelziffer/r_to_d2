# r_to_d2

THIS IS AN ALPHA RELEASE. USE AT YOUR OWN RISK.

THIS SHIPS WITH GO BINARIES FOR ALL SUPPORTED PLATFORMS. IT'S AN 800MB DOWNLOAD!

## Installation

Install the gem and add to the application's Gemfile by executing:

```bash
bundle add r_to_d2
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
gem install r_to_d2
```

## Usage

```ruby
svg_string = R2D2.to_svg('a -> b')
File.open('test.svg', 'w').write(svg_string)
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dunkelziffer/r_to_d2.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
