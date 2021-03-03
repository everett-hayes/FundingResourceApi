class ResourceController < ApplicationController
    
    include CurrentUserConcern

    # GET request
    # used by all users to load active resources: baseurl/resource
    def index
        @resources = Resource.where("is_approved = true")
        render json: @resources, status: 200
    end

    # GET request
    # used by all users to find a single resource: baseurl/resource/<some_id>
    def show
        @resource = Resource.find(params[:id])
        render json: @resource, status: 200
    end

    # POST request
    # used by logged in users to create new resources: baseurl/resource
    def create
        if @current_user
            @resource = Resource.create(resource_params)
            render json: @resource, status: 200
        else
            render json: {}, status: 401
        end 
    end

    # Specifies params required for a POST/PUT request
    private
        def resource_params
            params.require(:resource).permit(
                :source, 
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