require "option_parser"

source_file? : String? = nil

parser = OptionParser.new do |parser|
  parser.banner = "usage: bin/flowmaker SOURCE"

  parser.unknown_args do |args|
    if args.size > 0
      source_file? = args.first
    end
  end
end

parser.parse!

if source_file?.nil?
  puts "missing SOURCE"
  puts parser
  exit 1
end

source_file = source_file?.not_nil!
temp_dir = Dir.tempdir

`crystal run #{source_file} > #{temp_dir}/intermediate.xml`
`plutil -convert binary1 -o #{temp_dir}/output.shortcut #{temp_dir}/intermediate.xml`
`mv #{temp_dir}/output.shortcut ./#{source_file}.shortcut`
