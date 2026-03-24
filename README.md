# r_to_d2

THIS IS AN ALPHA RELEASE. USE AT YOUR OWN RISK.

This gem ships Go executables downloaded from here: https://github.com/terrastruct/d2/releases

## Installation

> :warning: If your CPU architecture or operating system isn't supported, the following
> steps will install the gem for the `ruby` platform. That is a gem without the Go binary,
> which raises errors on usage.

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
svg_string = RToD2.to_svg('a -> b')
File.open('test.svg', 'w').write(svg_string)
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dunkelziffer/r_to_d2.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
