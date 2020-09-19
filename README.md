# LogParser

Provided webserver.log file was used to get requirements for validation. That is the reason why only format present in the websever.log file is allowed. IPs(not really IPs but) must be 3 numbers X 4 and paths have to start with / and can only contain a-z or 0-9 or -.

## Installation

```git
git clone https://github.com/sedadkosovac/log_parser.git
```

And then execute:

    $ bundle install

## Usage
Form project directory:

```bash
bundle exec ruby log_parser.rb logs/webserver.rb
```

## Tests

```ruby
  rubocop
  rspec spec
  
  # Mac Terminal
  open coverage/index.html
  
  # debian/ubuntu Terminal
  xdg-open coverage/index.html
```

## License

The project is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the LogParser project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/log_parser/blob/master/CODE_OF_CONDUCT.md).
