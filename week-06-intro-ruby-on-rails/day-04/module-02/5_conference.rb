require 'ffaker'
require './models/speaker.rb'
require './models/talk.rb'

5.times do
  p "created an instance of a speaker..."
end

puts "Speakers"
puts "========"
Speaker.all.each do |speaker|
  p speaker
end


puts "Talks"
puts "========"
