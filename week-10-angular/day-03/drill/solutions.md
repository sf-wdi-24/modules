# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> File Manipulation - Solutions

1.

```rb
# in your terminal
somefile = File.open("pair-info.txt", "w")
somefile.puts "Ben Manning"
somefile.puts "I love to play drums and sling code"
somefile.puts "I would love to visit Germany"
somefile.close
```

2.

```rb
# in your terminal
File.open("riddle.txt").readlines.each do |line|
  puts line
end
```

3.

```rb
# in the terminal
require 'rubygems'
require 'rest-client'

deadspin_url = "http://www.deadspin.com/"
local_filename = "favorite.html"

File.open(local_filename, "w") do |file|
   file.write(RestClient.get(deadspin_url))
end
```
