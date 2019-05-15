class CollegesController < ApplicationController
    def show
        @college = College.find_by(id: params[:id])
    end
end
