
class Analysis < ApplicationRecord
    

    has_one_attached :csv
   
    def process_csv
        
        require 'csv'
        return "no hay archivo" unless csv.attached?

        

        file = csv.download
        data = CSV.parse(file, headers: true)

        values = data.map { |row |row[column_name].to_f}

        case operation 
        when "sum"
            values.sum
        when "average"
            return "Campo vacio" if values.empty?
            values.sum/values.size
        when "max"
            values.max 
        when "min"
            values.min
        else
            "Operacion no valida"
        end  
    end                     


end
