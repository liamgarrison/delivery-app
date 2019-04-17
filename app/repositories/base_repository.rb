require 'csv'
require 'pry-byebug'

class BaseRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @elements = []
    csv_load if File.exist?(@csv_file_path)
    @next_id = @elements.empty? ? 1 : @elements.last.id + 1
  end

  def all
    @elements
  end

  def add(element)
    element.id = @next_id
    @elements << element
    @next_id += 1
    csv_save
  end

  def destroy(id)
    @elements.delete_if { |element| element.id == id }
    csv_save
  end

  def find(id)
    @elements.find { |element| element.id == id }
  end

  def csv_save
    # Write headers and elements to CSV
    CSV.open(@csv_file_path, "wb") do |csv|
      # Write the headers first - use a blank element to get headers
      csv << build_element({}).headers
      # Then write the values
      @elements.each do |element|
        csv << element.build_row
      end
    end
  end

  def csv_load
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      @elements << build_element(row)
    end
  end
end
