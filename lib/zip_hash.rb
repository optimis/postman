require 'rubygems'
require 'csv'

class ZipHash
  def initialize(path)
    @data = {}

    load_data(path)
  end

  def load_data(path)
    CSV.foreach(path, :col_sep => "\t") do |row|
      @data[row[1]] = {
        :city => row[2],
        :state => row[3],
        :'state-abbreviation' => row[4]
      }
    end
  end

  def get(zip)
    @data[zip.to_s]
  end
end
