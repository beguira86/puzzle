class GamesController < ApplicationController
	def index
		@games = Game.where(puzzle_id: params[:id])   #.order("time").limit(10)
		render "index.json.jbuilder", status: :ok
	end

	def save
		@game = current_user.games.new(time: params[:time], puzzle_id: :id)
	#	@game = Game.new(user: user.id, time: params[:time], puzzle_id: :id)
		if @game.save
			render json: { puzzle: @game }, status: :ok
		else

			render json: { errors: @game.errors.full_messages },
        	status: :unprocessable_entity
		end
	end
end