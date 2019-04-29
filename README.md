# YARDoc Tutorial

## Installation
`gem install yard yard-sinatra`

## Usage

`yardoc --plugin yard-sinatra app.rb path/to/model.rb`

The above command creates a doc-directory containing the generated documentation site
## Documenting routes

```ruby
#app.rb
require_relative 'model'
require 'sinatra'

include Model

# Display Landing Page
#
get('/') do
end

# Displays search result based on search parameters
#
# @see Model#find_articles
get('/articles/search') do
end

# Displays a single Article
#
# @see Model#get_article
get('/articles/:id') do
end

# Creates a new article and redirects to '/articles'
#
# @see Model#create_article
post('/articles') do
end

# Attempts login and updates the session
#
# @see Model#login
post('/login') do
end
```

```ruby
module Model
    # Searches title and content for any matching text
    #
    # @param [Hash] params form data
    # @option params [String] search_terms
    #
    # @return [Array] containing the data of all matching articles
    def find_articles(params)
    end

    # Inserts a new row in the articles table
    #
    # @param [Hash] params form data
    # @option params [String] title The title of the article
    # @option params [String] content The content of the article
    #
    # @return [Hash]
    #   * :error [Boolean] whether an error occured
    #   * :message [String] the error message
    def create_article(params)
        # ...
        # ...
        # ...
    end

    # Finds an article
    #
    # @param [Hash] params form data
    # @option params [Integer] id The ID of the article
    #
    # @return [Hash]
    #   * :id [Integer] The ID of the article
    #   * :title [String] The title of the article
    #   * :content [String] The content of the article
    # @return [nil] if not found
    def get_article(params)
        # ...
        # ...
        # ...
    end

    # Finds an article
    #
    # @param [Hash] params form data
    # @option params [String] username The username
    # @option params [String] password The password
    #
    # @return [Integer] The ID of the user
    # @return [false] if credentials do not match a user
    def login(params)
        # ...
        # ...
        # ...
    end

end
```