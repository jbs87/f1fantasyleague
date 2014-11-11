class Driver < ActiveRecord::Base
  has_many :player_teams
end


# class Book
#   belongs_to :author, 
#            :class_name => "Author",
#            :foreign_key => "author_id"


#   belongs_to :author, 
#            :class_name => "Person",
#            :foreign_key => "person_id"




#   belongs_to :author, 
#            :class_name => "Person"
# end

# class Team
#   belongs_to :driver1, 
#            :class_name => "Driver",
#            :foreign_key => "driver1_id"

# end