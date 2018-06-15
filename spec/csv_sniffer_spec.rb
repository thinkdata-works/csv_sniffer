require 'spec_helper'

describe CsvSniffer do
  def dc
    described_class
  end

  context 'csv file' do
    before(:all) do
      @csv_file = Tempfile.new('fil1e', binmode: 'wt+')
      @csv_file.puts "Name,Number"
      @csv_file.puts "John Doe,555-123-4567"
      @csv_file.puts "Jane C. Doe,555-000-1234"
      @csv_file.rewind
    end

    after(:all) { @csv_file.close }

    it 'should detect the delimiter' do
      expect(dc.detect_delimiter(@csv_file)).to eq(",")
    end

    it 'should detect if quote enclosed' do
      expect(dc.is_quote_enclosed?(@csv_file)).to be_falsey
    end

    it 'should get the quote character' do
      expect(dc.get_quote_char(@csv_file)).to be_nil
    end

    it 'should check if it has a header' do
      expect(dc.has_header?(@csv_file)).to be_truthy
    end

    it 'should get the first line' do
      expect(dc.first_line(@csv_file)).to eq("Name,Number")
    end

    it 'should get the first row' do
      expect(dc.first_row(@csv_file)).to eq(["Name", "Number"])
    end
  end

  context 'psv file' do
    before(:all) do
      @psv_file = Tempfile.new('file2', binmode: 'wt+')
      @psv_file.puts "'Name' |'Number'\t"
      @psv_file.puts "'John Doe'|'555-123-4567'"
      @psv_file.puts "'Jane C. Doe'|'555-000-1234'"
      @psv_file.rewind
    end

    after(:all) { @psv_file.close }

    it 'should detect the delimiter' do
      expect(dc.detect_delimiter(@psv_file)).to eq("|")
    end

    it 'should detect if quote enclosed' do
      expect(dc.is_quote_enclosed?(@psv_file)).to be_truthy
    end

    it 'should get the quote character' do
      expect(dc.get_quote_char(@psv_file)).to eq("'")
    end

    it 'should check if it has a header' do
      expect(dc.has_header?(@psv_file)).to be_truthy
    end
  end

  context 'semi-colon separated file' do
    before(:all) do
      @ssv_file = Tempfile.new('file3', binmode: 'wt+')
      @ssv_file.puts "John Doe;555-123-4567;Good\tdude"
      @ssv_file.puts "Jane C. Doe;555-000-1234   ; Great gal"
      @ssv_file.puts "John Smith;555-999-1234;Don't know about him"
      @ssv_file.rewind
    end

    after(:all) { @ssv_file.close }

    it 'should detect the delimiter' do
      expect(dc.detect_delimiter(@ssv_file)).to eq(";")
    end

    it 'should detect if quote enclosed' do
      expect(dc.is_quote_enclosed?(@ssv_file)).to be_falsey
    end

    it 'should detect if it has a header' do
      expect(dc.has_header?(@ssv_file)).to be_falsey
    end
  end

  context 'tab separated file without header' do
    before(:all) do
      @tsv = Tempfile.new('file4', binmode: 'wt+')
      @tsv.puts "Doe, John\t555-123-4567"
      @tsv.puts "Jane C. Doe\t555-000-1234\t"
      @tsv.rewind
    end

    after(:all) { @tsv.close }

    it 'should detect the delimiter' do
      expect(dc.detect_delimiter(@tsv)).to eq("\t")
    end

    it 'should detect if quote enclosed' do
      expect(dc.is_quote_enclosed?(@tsv)).to be_falsey
    end

    it 'should detect the quote character' do
      expect(dc.get_quote_char(@tsv)).to be_nil
    end

    it 'should detect if it has a header' do
      expect(dc.has_header?(@tsv)).to be_falsey
    end
  end

  context 'quoted psv without header' do
    before(:all) do
      @psv = Tempfile.new('file5', binmode: 'wt+')
      @psv.puts '"Doe,,,,,, John"|"555-123-4567"'
      @psv.puts %{"Jane C. Doe"|"555-000-1234\t"}
      @psv.rewind
    end

    after(:all) { @psv.close }

    it 'should detect delimiter' do
      expect(dc.detect_delimiter(@psv)).to eq("|")
    end

    it 'should detect if quote enclosed' do
      expect(dc.is_quote_enclosed?(@psv)).to be_truthy
    end

    it 'should get the quote character' do
      expect(dc.get_quote_char(@psv)).to eq('"')
    end
  end

  context 'psv with commas in cell' do
    before(:all) do
      @psv = Tempfile.new('file6', binmode: 'wt+')
      @psv.puts 'Name|Phone No.|Age'
      @psv.puts 'Doe, John|555-123-4567|31'
      @psv.puts 'Doe, Jane C. |555-000-1234|30'
      @psv.rewind
    end

    after(:all) { @psv.close }

    it 'should detect the delimiter' do
      expect(dc.detect_delimiter(@psv)).to eq("|")
    end

    it 'should detect if it has a header' do
      expect(dc.has_header?(@psv)).to be_truthy
    end
  end

  context 'empty file' do
    before(:all) do
      @empty = Tempfile.new('file7', binmode: 'wt+')
      @empty.rewind
    end

    after(:all) { @empty.close }

    it 'should detect delimiter' do
      # TODO .. finish these
    end
  end
end
