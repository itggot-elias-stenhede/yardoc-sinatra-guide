require_relative 'model/model.rb'
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
# @param [String] query_string, The search parameters delimited by spaces
get('/articles/search') do
    result = find_articles(params)
    slim(:search_result, locals:{articles:result})
end

# Displays a single Article
#
# @param [Integer] :id, the ID of the article
# @see Model#get_article
get('/articles/:id') do
    article = get_article(params)
    slim(:article, locals:{article:article})
end

# Creates a new article and redirects to '/articles'
#
# @param [String] title, The title of the article
# @param [String] content, The content of the article
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

# Updates an existing article and redirects to '/articles'
#
# @param [Integer] :id, The ID of the article
# @param [String] title, The new title of the article
# @param [String] content, The new content of the article
#
# @see Model#update_article
post('/articles/:id/update') do
    success = update_article(params)
    if success
        redirect('/articles')
    else
        session[:error_msg] = "Updating article failed"
        redirect('/error')
    end
end

# Deletes an existing article and redirects to '/articles'
#
# @param [Integer] :id, The ID of the article
# @param [String] title, The new title of the article
# @param [String] content, The new content of the article
#
# @see Model#delete_article
post('/articles/:id/delete') do
    success = delete_article(params)
    if success
        redirect('/articles')
    else
        session[:error_msg] = "Deleting article failed"
        redirect('/error')
    end
end

# Displays a login form
#
get('/login') do
    slim :login
end

# Displays a register form
#
get('/login') do
    slim :register
end

# Attempts login and updates the session
#
# @param [String] username, The username
# @param [String] password, The password
#
# @see Model#login
post('/login') do
    user_id = login(params)
    if user_id
        session[:user_id] = user_id
        redirect('/')
    else
        session[:error_msg] = "Invalid Credentials"
        redirect('/error')
    end
end

# Attempts login and updates the session
#
# @param [String] username, The username
# @param [String] password, The password
# @param [String] repeat-password, The repeated password
#
# @see Model#register_user
post('/register') do
    result = register_user(params)
    if result[:error] == false
        session[:user_id] = result[:user_id]
        redirect('/')
    else
        session[:error_msg] = result[:message]
        redirect back
    end
end

# Displays an error message
#
get('/error') do
    error_msg = session[:error_msg].dup
    session[:error_msg] = nil
    slim(:error, locals:{message:error_msg})
end