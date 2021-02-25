class ResourceController < ApplicationController
    include CurrentUserConcern
    def index
        @resources = Resource.all
        render json: @resources, status: 200
    end

    def create
        if @current_user
            @resource = Resource.create(resource_params)
            render json: @resource, status: 200
        else
            render json: {status: 401}
        end 
    end

    private
        def resource_params
            params.require(:resource).permit(:source, 
            :funding_name,
            :description,
            :amount,
            :contact_person,
            :web,
            :eligible,
            :deadline,
            :is_approved)
        end
end