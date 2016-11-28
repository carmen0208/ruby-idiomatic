# this is a command line, copy it and past it to command line
# usage:
#
# -n: telling it to loop over the lins of input data
# -a : telling it to automatically split each line into fields in a special
# array
# -rjson: tell it to require the json library
ruby -n -a -rjson \
  -e 'BEGIN { $/="\r\n"; $;=/:\s*/; headers={} }' \
  -e 'break if $F.size < 2' \
  -e 'headers[$F[0]] = $F[1].chomp' \
  -e 'END { puts JSON.pretty_generate(headers) }' \
  < 040_data.txt
  

