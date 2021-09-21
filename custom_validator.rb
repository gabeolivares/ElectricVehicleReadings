#!/usr/bin/env ruby
class CustomValidator
  def validate_params(input)
    filetype = input[0]
    query = input[1]
    argument = input[2]


    raise 'Missing filetype please provide a filetype.' if filetype.nil? || (!File.exists? filetype)
    raise 'Incorrect filetype. Please pass in a CSV filetype.' if File.extname(filetype) != '.csv'
    raise 'The CSV provide is empty.' if File.zero?(filetype)    
    raise 'Missing query please provide a query after CSV.' if query.nil?
    raise 'Missing argument please provide a argument after query.' if argument.nil?
  end
end
