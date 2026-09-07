module Api
  class WishlistsController < ApplicationController
    protect_from_forgery with: :null_session
    def create
      # user_id, property_id
      # save to table
      # return response to api call
      wishlist = Wishlist.create!(wishlist_params)
      respond_to do |format|
        format.json do
          render json: wishlist.to_json, status: :ok
        end
      end
    end

    def destroy
      # wishlist-id
      # delete from table
      # return response to api call

      wishlist = Wishlist.find(params[:id])
      wishlist.destroy()

      respond_to do |format|
        format.json do
          render json: { message: "successfully deleted", id: params[:id] }, status: :ok
        end
      end
    end

    private

    def wishlist_params
      params.permit(:user_id, :property_id)
    end
  end
end
