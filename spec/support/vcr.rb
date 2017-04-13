VCR.configure do |c|
  c.cassette_library_dir  = ["spec", "vcr"].join('/')
  c.hook_into :typhoeus
  c.configure_rspec_metadata!
end
