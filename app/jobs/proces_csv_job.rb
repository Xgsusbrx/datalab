class ProcesCsvJob < ApplicationJob
  queue_as :default

  def perform(analysis_id)
    analysis = Analysis.find(analysis_id)

    analysis.update(status: "processing")

    return fail_analysis(analysis, "No hay archivo CSV") unless analysis.csv.attached?

    file = analysis.csv.download
    data = CSV.parse(file, headers: true)

    unless data.headers.include?(analysis.column_name)
      return fail_analysis(analysis, "La columna no existe")
    end

    values = extract_numeric_values(data, analysis.column_name)

    if values.empty?
      return fail_analysis(analysis, "No hay valores numéricos válidos")
    end

    result = calculate(values, analysis.operation)

    analysis.update(
      Result: result,
      status: "completed",
      error_message: nil
    )

  rescue CSV::MalformedCSVError
    fail_analysis(analysis, "El archivo CSV es inválido")

  rescue StandardError => e
    fail_analysis(analysis, e.message)
  end

  private

  def extract_numeric_values(data, column_name)
    data.filter_map do |row|
      value = row[column_name]

      Float(value)
    rescue
      nil
    end
  end

  def calculate(values, operation)
    case operation
    when "sum"
      values.sum

    when "average"
      values.sum / values.size

    when "max"
      values.max

    when "min"
      values.min
    end
  end

  def fail_analysis(analysis, message)
    analysis.update(
      status: "failed",
      error_message: message
    )
  end
end