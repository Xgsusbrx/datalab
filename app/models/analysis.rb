
class Analysis < ApplicationRecord
    

    has_one_attached :csv

        OPERATIONS = %w[sum average max min]

    validates :column_name, :operation, presence: true
    validates :operation, presence: true, inclusion: { in: OPERATIONS}

    validate :csv_must_be_attached

    private 

    def csv_must_be_attached
        errors.add(:csv, "debe estar adjunto") unless csv.attached?
    end
           


end
