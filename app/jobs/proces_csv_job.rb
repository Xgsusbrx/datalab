class ProcesCsvJob < ApplicationJob
  queue_as :default

  def perform(analysis_id)
    analysis = Analysis.find(analysis_id)

    return unless analysis.csv.attached?

        file = analysis.csv.download
        data = CSV.parse(file, headers: true)

        values = data.map { |row| row[analysis.column_name]. to_f }
        resultado = calculate(values, analysis.operation)

        analysis.update(Result: resultado)
  end
  private


    
    
    def calculate(values, operation)
        case operation 
        when "sum"
            then values.sum
        when "average"
            return "Campo vacio" if values.empty?
            values.sum / values.size
        when "max"
            then values.max
        when "min"
            then values.min
        else "operacion no valida" 
        end
    end 
end
