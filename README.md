# EasyAuto

Simple CLI for git and github

## Installation

Add this line to your application's Gemfile:

    gem 'easy-auto'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install easy-auto

## Usage

To create a repo on github from your current project:

    $ create-repo
    
Follow the instructions to log in and name it. EasyAuto assumes your login is the same as the email addressed stored in your git config's email.

To open a pull-request:

    $ pull-request
    
Follow the prompts.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
