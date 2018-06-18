# CSV Sniffer

CSV Sniffer is a set of functions that allow a user heuristically detect the delimiter character in use, whether the values in the CSV file are quote enclosed, whether the file contains a header, and more. The library is intended to detect information to be used as configuration inputs for CSV parsers. For delimiter detection the following delimiters are currently supported `[",", "\t", "|", ";"]`

To ensure high performance and a low memory footprint, the library uses as little information as needed to make accurate decisions. Contributors are welcome to
improve the algorithms in use.


## Installation

```
$ gem install csv_sniffer
```

## Usage

Given a `some_file.csv` file:

```csv
Name;Phone
John Doe ;555-481-2345
Jane C. Doe;555-123-4567
```

Detection usage is as follows:

```rb
require "csv_sniffer"

delim = CsvSniffer.detect_delimiter("/path/to/some_file.csv") #=> ";"
is_quote_enclosed = CsvSniffer.is_quote_enclosed?("/path/to/some_file.csv") #=> false
has_header = CsvSniffer.has_header?("/path/to/some_file.csv") #=> true
```

See [`csv_sniffer_spec.rb`](spec/csv_sniffer_spec.rb) for more examples.


## Tests

```
$ docker build -t csv_sniffer_container .
$ docker run -t csv_sniffer_container rspec
```


## License

The MIT License (MIT)

Copyright &copy; 2015 Tim Ojo

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
