
class Analysis < ApplicationRecord
    

    has_one_attached :csv
   
    def process_csv
        require 'csv'
        return "no hay archivo" unless csv.attached?

        file = csv.download.force_encoding("UTF-8")

        file = csv.download
        data = CSV.parse(file, headers: true)

        values = data.map { |row |row[column_name].to_f}

        case operation 
        when "sum"
            values.sum
        when "average"
            values.sum / values.size
        when "max"
            values.max 
        when "min"
            values.min
        else
            "Operacion no valida"
        end  
    end                     


end
