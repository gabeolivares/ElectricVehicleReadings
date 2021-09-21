require "spec_helper"
require_relative '../ev_methods'

RSpec.describe EvMethods do
  let(:method_call) { EvMethods.new(params).run }
  let(:params) { [filetype, query, argument] }
  let(:filetype) { 'test_files/test.csv' }

  context 'The charged_below method is called' do
    let(:query) { 'charged_below' }
    let(:argument) { '.33' }

    it 'raises an error' do
        expect { method_call }.to raise_error('The query you passed in does not exist. Try again.')
    end
  end

  context 'The charged_above method is called' do
    let(:query) { 'charged_above' }

    context 'and the argument is 33 %' do
      let(:argument) { '.33' }
      let(:correct_vehicle_no) { "5" }

      it 'it returns the correct response' do
        expect { method_call }.to output("There are #{correct_vehicle_no} vehicles charged aboved #{argument}\n").to_stdout
      end
    end

    context 'and the argument is 50 %' do
      let(:argument) { '.50' }
      let(:correct_vehicle_no) { "5" }

      it 'it returns the correct response' do
        expect { method_call }.to output("There are #{correct_vehicle_no} vehicles charged aboved #{argument}\n").to_stdout
      end
    end

    context 'and the argument is 10 %' do
      let(:argument) { '.1' }
      let(:correct_vehicle_no) { "5" }

      it 'it returns the correct response' do
        expect { method_call }.to output("There are #{correct_vehicle_no} vehicles charged aboved #{argument}\n").to_stdout
      end
    end

    context 'and the argument is 90 %' do
      let(:argument) { '.9' }
      let(:correct_vehicle_no) { "4" }

      it 'it returns the correct response' do
        expect { method_call }.to output("There are #{correct_vehicle_no} vehicles charged aboved #{argument}\n").to_stdout
      end
    end
  end

  context 'The average_daily_miles method is called' do
    let(:query) { 'average_daily_miles' }

    context 'and the argument is clown-car' do
      let(:argument) { 'clown-car' }
      let(:total_mileage) { 82.0 }
      let(:total_days) { 13 }
      let(:average_miles) { (total_mileage/total_days).round(2) }

      it 'it returns the correct response' do
        expect { method_call }.to output("Vehicle: #{argument} drove #{total_mileage} miles over #{total_days} days and averaged #{average_miles} miles per day.\n").to_stdout
      end
    end

    context 'and the argument is cat-car' do
      let(:argument) { 'cat-car' }
      let(:total_mileage) { 75.0 }
      let(:total_days) { 7 }
      let(:average_miles) { (total_mileage/total_days).round(2) }

      it 'it returns the correct response' do
        expect { method_call }.to output("Vehicle: #{argument} drove #{total_mileage} miles over #{total_days} days and averaged #{average_miles} miles per day.\n").to_stdout
      end
    end

    context 'and the argument is electric-suv' do
      let(:argument) { 'electric-suv' }
      let(:total_mileage) { 99.0 }
      let(:total_days) { 7 }
      let(:average_miles) { (total_mileage/total_days).round(2) }

      it 'it returns the correct response' do
        expect { method_call }.to output("Vehicle: #{argument} drove #{total_mileage} miles over #{total_days} days and averaged #{average_miles} miles per day.\n").to_stdout
      end
    end

    context 'and the argument is big-truck' do
      let(:argument) { 'big-truck' }
      let(:total_mileage) { 161.0 }
      let(:total_days) { 13 }
      let(:average_miles) { (total_mileage/total_days).round(2) }

      it 'it returns the correct response' do
        expect { method_call }.to output("Vehicle: #{argument} drove #{total_mileage} miles over #{total_days} days and averaged #{average_miles} miles per day.\n").to_stdout
      end
    end
  end
end
