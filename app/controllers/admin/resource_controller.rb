class Admin::ResourceController < ApplicationController

    include CurrentUserConcern

    before_action :check_admin

    # GET request
    # used by admins users to load inactive resources: baseurl/admin/resource
    def index
        @resources = Resource.where("is_approved = false")
        render json: @resources, status: 200
    end

    # PUT request
    # used by admin users to make activate submitted resources: baseurl/admin/resource/<some_id>
    def update
        @resource = Resource.find(params[:id])
        @resource.update(resource_params)
        render json: @resource, status: 200
    end

    # DELETE request
    # used by admin users to delete: baseurl/admin/resource/<some_id>
    def destroy
        @resource = Resource.find(params[:id])
        @resource.delete()
        render json: {status: 200}
    end

    # this method runs before all of the baseurl/admin endpoints, see the before_action
    private
        def check_admin
            if not (@current_user && @current_user.is_admin)
                render json: {}, status: 401
            end
        end

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