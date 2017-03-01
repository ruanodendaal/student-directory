file = File.open(__FILE__)
file.readlines.each { |line| puts line }


# quine?
x = "x = ;puts x+34.chr+x+34.chr";puts x+34.chr+x+34.chr

# or
eval s="print 'eval s=';p s"
