# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> File Manipulation - Solutions


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
