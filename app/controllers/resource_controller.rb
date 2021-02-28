class ResourceController < ApplicationController
    include CurrentUserConcern

    def index
        if params[:status] == "admin"
            if @current_user.is_admin
                @resources = Resource.where("is_approved = false")
                render json: @resources, status: 200
            else
                render json: {status: 401}
            end 
        else
            @resources = Resource.where("is_approved = true")
            render json: @resources, status: 200
        end
    end

    def show
        @resource = Resource.find(params[:id])
        render json: @resource, status: 200
    end

    def create
        if @current_user
            @resource = Resource.create(resource_params)
            render json: @resource, status: 200
        else
            render json: {status: 401}
        end 
    end

    def update
        if @current_user.is_admin
            @resource = Resource.find(params[:id])
            @resource.update(resource_params)
            render json: @resource, status: 200
        else
            render json: {status: 401}
        end 
    end

    def destroy
        if @current_user.is_admin
            @resource = Resource.find(params[:id])
            @resource.delete()
            render json: {status: 200}
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