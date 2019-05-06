require_relative 'model'
require 'sinatra'
require 'slim'

enable :sessions

include Model # Wat dis?

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