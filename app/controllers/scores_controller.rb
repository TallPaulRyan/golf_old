class ScoresController < ApplicationController
  


  def index
  	@scores = Score.all 
  end

  def new
  	@score = Score.new
  end

  def create
  	@score = Score.new(score_params)
  	if @score.save
  		redirect_to root_path
  	else
  		render 'new'
  	end
  end

  def destroy
  end

  private

  	def score_params
  		params.require(:score).permit(:hole1,:hole2,:hole3)
  	end

end
