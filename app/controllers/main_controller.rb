class MainController < ApplicationController 
    def index
        @some_secret_key=ENV['SOME_SECRET_KEY']
    end
end