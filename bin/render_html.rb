#!/usr/bin/env ruby

require 'ut2004stats/parser/OLStats'
require 'ut2004stats/output/html'
require 'ut2004stats/pretty'

require 'optparse'
require 'fileutils'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: render_html.rb [options]"

  opts.on("-oDIRECTORY", "--outputdir=DIRECTORY", "Directory into which to output HTML report") do |d|
    options[:outdir] = d
  end
end.parse!

unless options[:outdir]
    puts "An output directory must be specified!"
    exit
end

outputter = UT2004Stats::Output::HTML.new

outputter.output( options[:outdir] )
