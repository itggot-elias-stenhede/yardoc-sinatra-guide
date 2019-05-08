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

    # Attempts to insert a new row in the articles table
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
    
    # Attempts to update a row in the articles table
    #
    # @param [Integer] article_id The article's ID
    # @param [Hash] params form data
    # @option params [String] title The title of the article
    # @option params [String] content The content of the article
    #
    # @return [Hash]
    #   * :error [Boolean] whether an error occured
    #   * :message [String] the error message
    def update_article(article_id, params)
        # ...
        # ...
        # ...
    end

    # Attempts to delete a row from the articles table
    #
    # @param [Integer] article_id The article's ID
    # @param [Hash] params form data
    # @option params [String] title The title of the article
    # @option params [String] content The content of the article
    #
    # @return [Hash]
    #   * :error [Boolean] whether an error occured
    #   * :message [String] the error message
    def delete_article(article_id, params)
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
    
    # Attempts to create a new user
    #
    # @param [Hash] params form data
    # @option params [String] username The username
    # @option params [String] password The password
    # @option params [String] repeat_password The repeated password
    #
    # @return [Hash]
    #   * :error [Boolean] whether an error occured
    #   * :message [String] the error message if an error occured
    #   * :user_id [Integer] The user's ID if the user was created
    def register_user(params)
        # ...
        # ...
        # ...
    end

end