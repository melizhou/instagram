class PhotosController < ApplicationController
	before_action :authenticate_user!, :except => [:index, :show]
	def newsfeed
		@photos = Photo.all
	end

	def index
		@photos = current_user.photos.all 
	end 
	def new
		@photo = Photo.new
	end
	def show
		@photo = Photo.find params[:id]
	end

	def edit
		@photo = Photo.find params[:id]
	end

	def create
		@photo = current_user.photos.new(photo_params)
		if @photo.save
			redirect_to @photo
		else
			render 'new'
		end
	end

	def update
		@photo = Photo.find(params[:id])

		if @photo.update(photo_params)
			redirect_to @photo
		else 
			render 'edit'
		end
	end

	def destroy
		@photo = Photo.find(params[:id])
		@photo.destroy

		redirect_to photos_path
	end

	private
	def photo_params
	params.require(:photo).permit(:public,:caption, :image)
	end 
end