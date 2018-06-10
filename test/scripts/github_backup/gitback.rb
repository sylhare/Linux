#gitback 0.1
#credits: Walter White, Updates: Addy Osmani
# sudo ruby gitback.rb
#!/usr/bin/env ruby

# dependencies
require "yaml"
require "open-uri"

# your github username
username = "Sylhare"

time = Time.new
# feel free to comment out the option you don't wish to use.
backupDirectory = "/backups/github/#{time.year}.#{time.month}.#{time.day}"
#or simply: backupDirectory = "/backups/github/"

#repositories =
# .map{|r| %Q[#{r[:name]}] }

#FileUtils.mkdir_p #{backupDirectory}

YAML.load(open("http://github.com/api/v2/yaml/repos/show/#{username}"))['repositories'].map{|repository|

    puts "discovered repository: #{repository[:name]} ... backing up ..."
    #exec
    system "git clone git@github.com:#{username}/#{repository[:name]}.git #{backupDirectory}/#{repository[:name]}"
}