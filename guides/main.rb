#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

# 1. Unzip archive.zip (downloaded from Google Translator Toolkit)
# 2. Change file extensions to appropriate ones (e.g. .txt -> .md)
# 3. Copy the files to the 'guides/source/ja-JP' directory to generate HTMLs.

require 'FileUtils'
ARCHIVE_NAME="archive.zip"
`rm -rf archive/`
`unzip #{ARCHIVE_NAME}`

Dir.glob("archive/ja/**") do |filename|
  new_name = filename.gsub(".txt", ".md").gsub(".md.md", ".md").gsub(".erb.md", ".erb")
  puts "Rename: #{filename}\t->\t#{new_name}"
  FileUtils.mv(filename, new_name) unless filename == new_name

  # Current Dir is same as the dir when you execute
  FileUtils.cp(new_name, "./source/")
end
