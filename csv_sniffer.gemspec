Gem::Specification.new do |spec|
  spec.name        = 'csv_sniffer'
  spec.version     = '0.2.0'
  spec.date        = '2018-06-15'
  spec.summary     = "CSV library for heuristic detection of CSV properties"
  spec.description = "CSV Sniffer is a set of functions that allow a user detect the delimiter character in use, whether the values in the CSV file are quote enclosed, whether the file contains a header, and more. The library is intended to detect information to be used as configuration inputs for CSV parsers."
  spec.authors     = ["Chris Sandison"]
  spec.email       = 'chris@thinkdataworks.com'
  spec.homepage    = 'https://github.com/thinkdataworks/csv_sniffer'
  spec.license     = 'MIT'

  spec.files       = `git ls-files`.split($/)
  spec.test_files  = spec.files.grep(/.*_spec\.rb/)

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-core"
  spec.add_development_dependency "rspec-mocks"
  spec.add_development_dependency "factory_girl"
  spec.add_development_dependency "rack"
  spec.add_development_dependency "rack-test"
end
