Electric Vehicle Readings Script
---------------------------------
TESTED ON MacOS Catalina V 10.15.7

REQUIREMENTS:
-Make sure Ruby is installed: https://www.ruby-lang.org/en/documentation/installation/
-I used ruby version ruby 2.6.5 (use 'ruby -v' via comand line to verify)

GEMS:
-Make sure Rspec is installed: 'gem install rspec' or https://rubygems.org/gems/rspec/versions/3.10.0

PROJECT OVERVIEW:
This project is a ruby based script that is to be ran via command line. This file accepts 3 arguments -
A filetype(CSV), a query describing the type of method you want to execute, and an argument that
corresponds to that method.
This project currently has two working executable methods(charged_above & average_daily_miles)

1.charged_above: This query should return the number of vehicles that reported at least one charge_reading
above a given % over the whole time period. It should take a charge % as an argument. This argument should
be a decimal, for example 0.33 will be passed to indicate 33%.

2.average_daily_miles: This query should return the average daily miles for a given vehicle over the course
of the time period of the dataset, so it should take vehicle_id as an argument. (For example, if the given
vehicle travelled 140 miles over a two week period, this should return 10).

HOW TO EXECUTE:
In ElectricVehicleReadings directory type 'ruby ev_data_query.rb FILETYPE_PATH QUERY ARGUMENT'
Example:
'ruby ev_data_query.rb ev_data.csv average_daily_miles hamster-car'


HOW TO RUN RSPEC TEST
In ElectricVehicleReadings directory run rspec test by typing
'rspec spec'
