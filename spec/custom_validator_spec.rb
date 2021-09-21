require "spec_helper"
require_relative "../custom_validator"
base = CustomValidator.new

describe "#validate_params" do
  let(:method_call) { base.validate_params(params) }
  let(:params) { [filetype, query, argument] }

  context 'the filetype variable is nil' do
    let(:filetype) { nil }
    let(:query) { nil }
    let(:argument) { nil }

    it 'raises an error' do
        expect { method_call }.to raise_error('Missing filetype please provide a filetype.')
    end
  end

  context 'the filetype variable is not a pdf' do
    let(:filetype) { 'test_files/test.pdf'}
    let(:query) { nil }
    let(:argument) { nil }

    it 'raises an error' do
        expect { method_call }.to raise_error('Incorrect filetype. Please pass in a CSV filetype.')
    end
  end

  context 'the csv file is empty' do
    let(:filetype) { 'test_files/empty_file.csv' }
    let(:query) { nil }
    let(:argument) { nil }

    it 'raises an error' do
        expect { method_call }.to raise_error('The CSV provide is empty.')
    end
  end

  context 'the query is nil' do
    let(:filetype) { 'test_files/test.csv' }
    let(:query) { nil }
    let(:argument) { nil }

    it 'raises an error' do
        expect { method_call }.to raise_error('Missing query please provide a query after CSV.')
    end
  end

  context 'the argument variable is nil' do
    let(:filetype) { 'test_files/test.csv' }
    let(:query) { 'charged_above' }
    let(:argument) { nil }

    it 'raises an error' do
        expect { method_call }.to raise_error('Missing argument please provide a argument after query.')
    end
  end

  context 'All variables validate' do
    let(:filetype) { 'test_files/test.csv' }
    let(:query) { 'charged_above' }
    let(:argument) { '.33' }

    it 'no errors are raised' do
        expect(method_call).to eq nil
    end
  end
end
