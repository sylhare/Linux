#gitback json
# Use sudo ruby gitback.rb because it creates the folder as well
#!/usr/bin/env ruby

# dependencies
require "json"
require "open-uri"

# your github username
username = "Sylhare"

time = Time.new
# feel free to comment out the option you don't wish to use.
backupDirectory = "/backups/github/#{time.year}-#{time.month}-#{time.day}"
#or simply: backupDirectory = "/backups/github/"

#repositories =
# .map{|r| %Q[#{r[:name]}] }

#FileUtils.mkdir_p #{backupDirectory}

JSON.load(open("https://api.github.com/users/#{username}/repos")).each { |repo| 
    
    puts "\n" + "Backing up: #{repo["name"]}"
    system "git clone #{repo["clone_url"]} ./#{backupDirectory}/#{repo["name"]}"

}