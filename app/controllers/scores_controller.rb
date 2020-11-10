class ScoresController < ApplicationController
  
  before_action :authorize

  def index
  	@scores = Score.all 
  end

  def show
  	@score = Score.find(params[:id])
  end

  def new
  	@score = Score.new
  end

  def edit
  	@score = Score.find(params[:id])
  end

  def create
  	@score = Score.new(score_params)
  	if @score.save
  		redirect_to root_path
  	else
  		render 'new'
  	end
  end

  def update
  	@score = Score.find(params[:id])

  	if @score.update(score_params)
  		redirect_to scores_path
  	else
  		render 'edit'
  	end
  end

  def destroy
  	@score = Score.find(params[:id])
  	@score.destroy

  	redirect_to scores_path
  end

  private

  	def score_params
  		params.require(:score).permit(:hole1,:hole2,:hole3)
  	end

end
