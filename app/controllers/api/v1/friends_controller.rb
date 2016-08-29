class Api::V1::FriendsController < ApplicationController

  def show
    render json: User.find(params[:id]), serializer: FriendSerializer
  end

end
