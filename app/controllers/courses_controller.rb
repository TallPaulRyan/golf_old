class CoursesController < ApplicationController

	def index
		@courses = Course.all
	end

	def show
		@course = Course.find(params[id])
	end

	def new
		@course = Course.new
	end

	def initialize_course_details
		# We'd like to handle the ajax subission here.
		# Once the course is selected, we will generate course detail objects
		# 	to populate the dynamically generated form
		@course = Course.new(course_params)
		respond_to do |format|
			if @course
				(@course.holes).times { @course.course_details.build }
				# format.html { render 'new'}
				# binding.pry
				format.js
			else
				format.html { render 'new'}
			end
		end
	end

	def edit
	end

	def create
	end


	private

		def course_params
			params.require(:course).permit(:name,:holes,:par)
		end

		def course_details_params
			params.require(:course).require(:course_details).permit(:hole_number,:hole_par)
		end
end
