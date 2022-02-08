class Actor < ApplicationRecord
	#validates method specifies that an actor is vaild only if
	#both values are present
	validates :first_name, :last_name, presence: true
end
