class AdminsController < ApplicationController
	before_action :authenticate_admin!
	def top
	end

	def index
		@users = User.all.order(user_kana: "ASC")
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end
end
