require 'yaml'
require 'erb'
require 'tempfile'

metadata = YAML.load_file('023_meta.yaml')
title = metadata[:title]
description = metadata[:description]

template = ERB.new(<<EOF) 
  <dc:title> <%= title %> </dc:title>
  <dc:description> <%= description %></dc:description>
EOF

epub_meta = template.result(binding)

Tempfile.open('epub_metadata') do |meta|
  puts "Tempfile: #{meta.path}"
  meta.write(epub_meta) 
  meta.close
  args = %W[-S --epub-metadata=#{meta.path} -o book.epub 023_tempfile_template.md]
  system('pandoc', *args)
end


