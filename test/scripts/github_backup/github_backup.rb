#github backup
#Simply clone all of the github user here, with repo's name as folder name.
#credits: Sylhare
#!/usr/bin/env ruby

# dependencies
require "json"
require "open-uri"

#Github usernaùe
username = "Sylhare"

JSON.load(open("https://api.github.com/users/#{username}/repos")).each { |repo| %x[git clone #{repo["clone_url"]} ]}