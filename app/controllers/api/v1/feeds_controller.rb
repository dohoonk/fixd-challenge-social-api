class Api::V1::FeedsController < ApplicationController
    def index
        user = User.find(params[:user_id])
        render 'feeds/index', formats: [:json], handlers: [:jbuilder], status: 201
    end
end