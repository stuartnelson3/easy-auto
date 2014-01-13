# EasyAuto
[![Build Status](https://travis-ci.org/stuartnelson3/easy-auto.png?branch=master)](https://travis-ci.org/stuartnelson3/easy-auto)

Simple CLI for git and github

## Installation

Add this line to your application's Gemfile:

    gem 'easy-auto'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install easy-auto

## Setup

Configure your computer for easy-auto:

    $ easy-authorize

Follow the prompts, then confirm the install worked:

    $ easy-setup

## Usage

To create a repo on github from your current project:

    $ create-repo

Follow the instructions.

Create a new branch:

    $ create-branch <new-branch-name> <OPTIONAL: branch-to-track>

The new branch is made from master if no second branch name is given.

To open a pull-request:

    $ pull-request

Follow the prompts.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
