# YARDoc Tutorial

[Generated Site](https://itggot.github.io/yardoc-sinatra-guide/docs/top-level-namespace.html)

## Installation
`gem install bundler`

Create a file named `Gemfile` in your project root

Append these to your Gemfile
`source "https://rubygems.org"`

`gem 'yard'`

`gem 'yard-sinatra', git: 'https://github.com/chrisb/yard-sinatra'`


Run `bundle install`

## Usage

`bundle exec yardoc --plugin yard-sinatra app.rb path/to/model.rb`

The above command creates a doc-directory containing the generated documentation site

## Documenting routes
See [app.rb](./app.rb)

## Documenting functions
See [model.rb](./model/model.rb)
