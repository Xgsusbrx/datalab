
class Analysis < ApplicationRecord
    

    has_one_attached :csv

    validates :column_name, :operation, presence: true
   
             


end
