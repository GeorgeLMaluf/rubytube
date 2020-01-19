class VideosController < ApplicationController
	before_action :authenticate_user!, except: [:show]
	before_action :set_video, only: [:show, :edit, :update, :destroy]

	def index
		@videos = current_user.videos.all.order("id DESC")
	end


	def show
	end

	def new
		@video = Video.new
	end

	def create
		@video = Video.new(video_params)
		@video.user_id = current_user.id
		if @video.save
			redirect_to videos_path, notice: 'Seu video foi salvo com sucesso'
		else
			render :new
		end		
	end

	def edit
	end

	def update
		if @video.update(video_params)
			redirect_to videos_path, notice: 'Video editado com sucesso'
		else
			render :edit
		end
	end

	def destroy
		@video.destroy
		redirect_to videos_path, notice: 'Video removido'
	end

	private
	  def video_params
	  	params.require(:video).permit(:nome, :url)
	  end

	  def set_video
	  	@video = Video.find(params[:id])
	  end
end