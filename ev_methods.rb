require 'csv'
require 'date'
require 'pry'


class EvMethods
  VEHICLE_ID = 0
  CHARGE_READING = 1
  RANGE_ESTIMATE = 2
  ODOMETER = 3
  PLUGGED_IN = 4
  CHARGING = 5
  CREATED_AT = 6
  attr_accessor :filetype, :query, :argument

  def initialize(args)
    @filetype = args[0]
    @query = args[1]
    @argument = args[2]
  end

  def run
    case @query
    when 'charged_above'
     charged_above
    when 'average_daily_miles'
     average_daily_miles
   when 'drove_nowhere'
    drove_nowhere
   else
     raise 'The query you passed in does not exist. Try again.'
    end
  end

  def charged_above
    vehicle_data = []
    input_charge = @argument

    CSV.foreach(@filetype).with_index do |row, i|
      next if i == 0
      charge_reading = row[CHARGE_READING]
      vehicle_data << { "vehicle" => row[VEHICLE_ID] } if charge_reading.to_f >= input_charge.to_f
    end
    charged_above_count = vehicle_data.uniq.count

    puts "There are #{charged_above_count} vehicles charged aboved #{input_charge}"
  end

  def average_daily_miles
    vehicle_data = []
    vehicle      = @argument

    CSV.foreach(@filetype).with_index do |row, i|
      next if i == 0
      vehicle_data << { "mileage" => row[ODOMETER].to_f, "date" => row[CREATED_AT] } if row[VEHICLE_ID] == vehicle
    end

    max_mileage   = vehicle_data.max_by{|k| k["mileage"] }["mileage"]
    min_mileage   = vehicle_data.min_by{|k| k["mileage"] }["mileage"]
    start_date    = vehicle_data.min_by{|k| k["date"] }["date"]
    end_date      = vehicle_data.max_by{|k| k["date"] }["date"]
    total_days    = (Date.parse(end_date) - Date.parse(start_date)).to_i
    total_mileage = max_mileage - min_mileage
    average_miles = total_mileage/total_days

    puts "Vehicle: #{vehicle} drove #{total_mileage} miles over #{total_days} days and averaged #{average_miles.round(2)} miles per day."
  end

  def drove_nowhere
    vehicle_data = []
    date         = format_date_by_day(@argument)
    drove_nowhere_count = 0

    CSV.foreach(@filetype).with_index do |row, i|
      next if i == 0
      created_at_date = format_date_by_day(row[CREATED_AT])
      vehicle_data << { "vehicle" => row[VEHICLE_ID], "odometer" => row[ODOMETER], "date" => created_at_date } if created_at_date == date
    end

    vehicle_names = vehicle_data.map{|x| x['vehicle']}.uniq

    vehicle_names.each do |vehicle|
      odometer_reading = []
      vehicle_data.each { |h| odometer_reading << h["odometer"] if h["vehicle"] == vehicle }
      drove_nowhere_count += 1 if odometer_reading.uniq.count == 1 && odometer_reading.count > 1 || odometer_reading.count == 1
    end

    puts "Total Number of Vehicles that drove no where are: #{drove_nowhere_count} on #{date}"
  end

  private
  def format_date_by_day(date)
    Date.parse(date).strftime("%F")
  end
end
