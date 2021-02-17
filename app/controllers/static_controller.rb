class StaticController < ApplicationController
    def home
        render json: {status: "This is working :)"}
    end
end
