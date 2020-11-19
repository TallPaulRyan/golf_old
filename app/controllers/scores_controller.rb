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
    @score = Score.new
    respond_to do |format|
      if params[:course].blank?
        @course = nil
        format.html { render 'new' }
      else
        @course = Course.find(params[:course][:id])
        # binding.pry
        format.html { render 'new' }
        format.js
      end
    end

  end

  def edit
  	@score = Score.find(params[:id])
  end

  def create
  	@score = Score.new(score_params)
    @score[:user_id] = current_user.id
    #binding.pry
    respond_to do |format|
    	if @score.save!
    		format.html { redirect_to scores_path }
    	else
    		format.html { render 'new' } 
    	end
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
