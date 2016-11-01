class UserProfilesController < ApplicationController
	def index
	end

	def new
		@userprofile = UserProfile.new
	end

	def create
		@userprofile = UserProfile.new(userprofile_params)
		@userprofile.user_id = current_user.id
		if @userprofile.save
			redirect_to articles_path, notice: "Added Successfully"
		else
			render action: "new", notice: "error"
		end
	end

	def show
		@user = UserProfile.find(params[:id])
	end

	def edit
		@userprofile = UserProfile.find(params[:id])
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
		params.require(:user_profile).permit(:first_name, :last_name, :tagline, :bio, :facebook_id, :twitter_id, :avatar)
	end

end
