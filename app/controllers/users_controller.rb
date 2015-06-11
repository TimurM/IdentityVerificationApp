require 'net/http'
require 'timeout'

class UsersController < ApplicationController

  def create
    @user = User.new
    @user.first_name = params["first_name"]
    @user.last_name = params["last_name"]
    @user.ip_address = params["ip_address"]

    begin
      status = Timeout::timeout(5) do

        @user = CalculateDistance.new(@user)

        render json: @user
      end
    rescue Timeout::Error
      render json: "Your Request timeout out, please try again later"
    end
  end

  def new

  end
end
