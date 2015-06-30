class PhotosController < ApplicationController
	def index		
		@photos = Photo.all
		@photos.each do |photo|
			if photo.public
				@visible_photos << photo 
			elsif photo.user_id == current_user.id
				@visible_photos << photo 				
			end
		end
	end

	def new
		@photo = Photo.new
	end
	def show
		@photo = Photo.find params[:id]
	end

	def edit
		@photo = Photo.find params [:id]
	end

	def create
		@photo = Photo.new(photo_params)
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