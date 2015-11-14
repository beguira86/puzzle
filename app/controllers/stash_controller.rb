#puzzle controller
class StashController < ActionController::Base

	def index
		@puzzles = Stash.order("about")
		render "index.json.jbuilder", status: :ok
	end

	def create
		@puzzle = Stash.create(stash_params.except(:image))
		#image = MiniMagick::Image.read(Base64.decode64(stash_params[:image]))
		#@puzzle.update image: File.open(image.path)
		#binding.pry

		if @puzzle.save
			render json: { puzzle: @puzzle }, status: :ok
		else

			render json: { errors: @puzzle.errors.full_messages },
        	status: :unprocessable_entity
		end
	end

	def show
		
		@puzzle = Stash.find_by(id: params[:id])
		
		#render some json
		render "show.json.jbuilder", status: :found
	end 

	private 
	def stash_params
		allow = [:image, :author, :about, :width, :height]
		params.require(:stash).permit(allow)

	end
end