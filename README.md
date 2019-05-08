# YARDoc Tutorial

[Generated Site](https://itggot.github.io/yardoc-sinatra-guide/docs/top-level-namespace.html)

## Installation
`gem install yard yard-sinatra`

## Usage

`yardoc --plugin yard-sinatra app.rb path/to/model.rb`

The above command creates a doc-directory containing the generated documentation site
## Documenting routes

```ruby
require_relative 'model'
require 'sinatra'
require 'slim'

enable :sessions

include Model

# Display Landing Page
#
get('/') do
    slim(:index)
end

# Displays search result based on search parameters
#
# @see Model#find_articles
get('/articles/search') do
    result = find_articles(params)
    slim(:search_result, locals:{articles:result})
end

# Displays a single Article
#
# @see Model#get_article
get('/articles/:id') do
    article = get_article(params)
    slim(:article, locals:{article:article})
end

# Creates a new article and redirects to '/articles'
#
# @see Model#create_article
post('/articles') do
    success = create_article(params)
    if success
        redirect('/articles')
    else
        session[:error_msg] = "Article creation failed"
        redirect('/error')
    end
end

# Attempts login and updates the session
#
# @see Model#login
post('/login') do
    user_id = login(params)
    if user_id
        session[:user_id] = user_id
        redirect('/')
    else
        sessino[:error_msg] = "Invalid Credentials"
        redirect('/error')
    end
end

# Displays an error message
#
get('/error') do
    error_msg = session[:error_msg].dup
    session[:error_msg] = nil
    slim(:error, locals:{message:error_msg})
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
        # ...
        # ...
        # ...
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
