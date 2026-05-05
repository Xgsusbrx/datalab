
# require 'csv'

# class CsvProcessor
#     def initialize(analysis)
#         @analysis = analysis
#     end
    
#     def call 
#         return "no hay archivo " unless @analysis.csv.attached?

#         file = @analysis.csv.download
#         data = CSV.parse(file, headers: true)

#         values = extract_values(data)

#         calculate(values)
#     end
    
    
#     private


#     def extract_values(data)
#         data.map { |row| row[@analysis.column_name].to_f }
#     end 
    
#     def calculate(values)
#         case @analysis.operation 
#         when "sum"
#             values.sum
#         when "average"
#             return "Campo vacio" if values.empty?
#             values.sum / values.size
#         when "max"
#             values.max
#         when "min"
#             values.min
#         else "operacion no valida" 
#         end
#     end 
# end     



