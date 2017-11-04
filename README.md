# Rubocop::Stylecheck

This gem is inspired by `ragnarson-stylecheck` gem.

This gem adds rake tasks which easily can invoke RuboCop with predefined options. You can use it in Ruby on Rails projects (with dedicated support from RuboCop side), but you can also use it in projects without Ruby on Rails - this gem supports both cases.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "rubocop-stylecheck"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rubocop-stylecheck

After all in Rakefile you must add:

```ruby
require "rubocop/stylecheck/rake_task"
```

## Usage

Available rake tasks:
* style - shortcut for style:rubocop:with_auto_correct
* style:rubocop:with_auto_correct - run RuboCop with auto correction
* style:rubocop:without_auto_correct - run RuboCop without auto correction
* style:rubocop:generate_local_config - generate rubocop config locally, if we want to override something

For generating local config file you must set:
```ruby
Rubocop::Stylecheck.config_path = "..."
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/alterans/rubocop-stylecheck.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

