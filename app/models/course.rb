class Course < ApplicationRecord
	has_one :course_details, dependent: :destroy
	has_many :scores

	accepts_nested_attributes_for :course_details
	
	validates :name, :presence => true, :uniqueness => true
end
