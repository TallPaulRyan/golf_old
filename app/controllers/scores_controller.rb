require 'pry'

class ScoresController < ApplicationController
  
  before_action :authorize

  def index
  	@scores = Score.all
    #binding.pry
  end

  def show
  	@score = Score.find(params[:id])
  end

  def new
    #binding.pry
  	@score = Score.new
    @courses = Course.new
  end

  def edit
  	@score = Score.find(params[:id])
  end

  def create
  	@score = Score.new(score_params)
    @score[:user_id] = current_user.id
    #binding.pry

  	if @score.save!
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
  		params.require(:score).permit(:user_id,:course_id,:hole_number,:hole_score)
  	end

end
