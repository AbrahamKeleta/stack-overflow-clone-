class Issue < ActiveRecord::Base
	has_many :comments 

	def self.search(queue)
		where("queue LIKE ?", "%#{queue}%") 
	end 
end
