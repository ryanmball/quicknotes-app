require 'http'
puts "Welcome to the Quicknotes App!"

def quicknote
  puts "Please select an action from the list and enter the corresponding number:"
  puts "1. View all notes"
  puts "2. Create a new note"
  puts "3. Update an existing note"
  puts "4. Delete a note"
  puts "5. Exit app"
  answer = gets.chomp.to_i

  if answer == 1
    puts "Here are all of your notes:"
    HTTP.post("http://localhost:3000/update_index")
    notes = HTTP.get("http://localhost:3000/notes")
    notes = notes.parse(:json)
    i = 1
    notes.each do |note|
      # date = DateTime.strptime(note["created_at"], "%m/%d/%Y %I:%M %p")
      puts "#{i}. Date: #{note["created_at"]}, Note: #{note["body"]}"
      i += 1
    end
    puts
    sleep 2
    quicknote
  elsif answer == 2
    puts "Please enter the body of your new note:"
    body = gets.chomp
    new_note = HTTP.post("http://localhost:3000/notes", :params => {:body => body})
    puts
    sleep 2
    quicknote
  elsif answer == 3
    puts "Please enter the ID of the note you would like to edit:"
    index = gets.chomp.to_i
    puts "Enter the updated body for the note. This will overwrite the previous text."
    body = gets.chomp
    update_note = HTTP.post("http://localhost:3000/notes/#{index}", :params => {:body => body})
    puts
    sleep 2
    quicknote
  elsif answer == 4
    puts "Please enter the ID of the note you would like to delete:"
    index = gets.chomp.to_i
    HTTP.delete("http://localhost:3000/notes/#{index}")
    puts
    sleep 2
    quicknote
  else
    puts "Goodbye!"
  end
end

quicknote