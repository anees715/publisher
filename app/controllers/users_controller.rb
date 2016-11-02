class UsersController < ApplicationController
	
	def index
	end

	def new
		@userprofile = UserProfile.new
	end

	def create
		@user_profile = UserProfile.new(userprofile_params)
		if @user_profile.save
			redirect_to users_path, notice: "Added Successfully"
		else
			render action: "new", notice: "error"
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.new
	end

	def update
		@user_profile = UserProfile.new
		if user_profile.update_attributes(user_profile_params)
			redirect users_path, notice: "Successfully Updated"
		else
			render action: "new"
		end
	end

private

	def userprofile_params
		params["userprofile"].permit(:firstname, :lastname)
	end

end
