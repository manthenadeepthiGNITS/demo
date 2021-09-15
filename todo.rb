puts "Fiction or non-fiction?"
genre = gets.chomp.downcase

if genre == "fiction"
  puts "Try reading Cryptonomicon by Neal Stephenson"
elsif genre == "non-fiction"
  puts "You should read The Ascent of Man by Jacob Bronowski!"
  else
  puts "Oh I don't know about that genre"
end