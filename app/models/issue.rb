class Issue < ActiveRecord::Base
	has_many :comments 

  def self.search(queue)
    # query = "SELECT * FROM issues WHERE (queue || solution ILIKE '%james%')"
    # result = ActiveRecord::Base.connection.execute(query)
    # byebug
    where('queue LIKE ?', '%' + queue.downcase + '%')
  end 
end
