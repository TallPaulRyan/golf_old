class Course < ApplicationRecord
	has_one :course_details, dependent: :destroy
	has_many :scores
	
	validates :name, :presence => true, :uniqueness => true
end
