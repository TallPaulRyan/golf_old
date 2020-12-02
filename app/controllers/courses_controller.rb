class CoursesController < ApplicationController


	def index
		@courses = Course.all
	end

	def show
		@course = Course.find(params[id])
	end

	def new
		@course = Course.new
		@course_details = Course.course_details.build
	end


	def edit
	end

	def create
		@course = Course.new(course_params)
		respond_to do |format|
			if @course
				format.html { render 'new'}
				format.js
			else
				format.html { render 'index'}
			end
		end
	end


	private

		def course_params
			params.require(:course).permit(:name,:holes,:par)
		end

		def course_details_params
			params.require(:course).require(:course_details).permit(:hole_number,:hole_par)
		end
end
