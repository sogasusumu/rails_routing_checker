# RailsRoutingChecker
`config/initializers/routing_checker.rb`を作成します。  
routingに、index, show, create, update, delete以外の、
アクションが設定されている場合、起動時に例外(RailsRoutingChecker::Error)が発生します。

## Usage
    rails g routing_checker create

    This will create:
        config/initializers/routing_checker.rb

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'rails_routing_checker', git: 'https://github.com/sogasusumu/rails_routing_checker.git'
```

And then execute:
```bash
$ bundle
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
