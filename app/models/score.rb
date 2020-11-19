class Score < ApplicationRecord
	belongs_to :course
	belongs_to :user

	validates :hole_number, :numericality => { :only_integer => true }
	validates :hole_number, :numericality => { less_than: 19 }

end
