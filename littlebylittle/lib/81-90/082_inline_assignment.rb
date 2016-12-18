book = open('???')
lines = 0
chunk = book.read(1024)
while chunk
  lines += chunk.count("\n")
  chunk = book.read(1024)
end

# the code contains 2 same lines separately, we can change it to a inline
# argument like this:
#
book = open('???')
lines = 0
while (chunk = book.read(1024))
  lines += chunk.count("\n")
end
# but be care, because it looks like a equal judgement condition
# while chunk == book.read(1024)

