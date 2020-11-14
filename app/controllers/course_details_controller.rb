class CourseDetailsController < ApplicationController


	def index
	end

	def show
		@course_detail = Course_detail.find(params[:id])
	end

	def new
	end

	def create
	end




end
