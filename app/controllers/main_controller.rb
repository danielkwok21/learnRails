class MainController < ApplicationController 
    def index
        @some_secret_key=ENV['SOME_SECRET_KEY']
        
        ipAPI =  IpApi.new()
        @response = ipAPI.get_details_by_ip(request.remote_ip)
    end
end
