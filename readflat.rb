require 'rubygems'
require 'bio'

entries = Bio::FlatFile.open(Bio::GenBank, ARGF)

output = File.open('result.txt', 'w')
	entries.each_entry do |entry|
		if !entries.eof? then	
			name = "#{entry.entry_id} #{entry.definition}"
			output.puts "Length of nucleotide sequence: " + entry.nalen.to_s
			output.puts entry.naseq.to_fasta(name)
			output.puts "Amino Acid Sequence: " + entry.naseq.translate
			output.puts "\n" 
		elsif entries.eof? then
			break
		end
	end 
entries.close
