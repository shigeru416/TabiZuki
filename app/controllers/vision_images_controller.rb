class VisionImagesController < ApplicationController

	def new
		@vision_image = VisionImage.new
	end

	def create
		@vision_image = VisionImage.new(vision_images_params)
		if @vision_image.save
			tags = Vision.get_image_data(@vision_image.image,"label")
			tags.each do |tag|
				@vision_image.vision_tags.create(name: tag[0], score: tag[1])
			end
			#landmarks = Vision.get_image_data(@vision_image.image,"landmark")
			#landmarks.each do |landmark|
				#a = @vision_image.vision_landmarks.create(name: landmark[0], score: landmark[1], location: landmark[2])
				#latlng = a.location.scan(/[+\-]?\d{1,3}.\d{1,14}/)
				#lat = latlng[0]
				#lng = latlng[1]
				#a.latitude = lat
				#a.longitude = lng
				#a.save
			#end
			if landmarks = Vision.get_image_data(@vision_image.image,"landmark").present?
				landmarks = Vision.get_image_data(@vision_image.image,"landmark").flatten
				@vision_image.vision_landmarks.create(
					name: landmarks[0],
					score: landmarks[1],
					location: landmarks[2],
					latitude: landmarks[2]["latLng"]["latitude"],
					longitude: landmarks[2]["latLng"]["longitude"]
				)

				redirect_to vision_image_path(@vision_image)
			else
				redirect_to vision_image_path(@vision_image)
			end
		else
			render :new
		end
	end

	def show
		@vision_image_new = VisionImage.new
		@vision_image = VisionImage.find(params[:id])
	end


	private
	def vision_images_params
		params.require(:vision_image).permit(:image)
	end
end