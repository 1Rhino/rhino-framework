require 'sqlite3'
require 'rhino/sqlite_model'

class Quotes < Rhino::Model::SQLite; end
STDERR.puts Quotes.schema.inspect

mt = Quotes.create 'title' => 'It happend', 'posted' => 1, 'body' => 'i did it'
mt = Quotes.create 'title' => 'I saw it'

p "Count #{Quotes.count}"

mt = Quotes.create("title" => "I created it first", "posted" => 1, "body" => "i created at first 123")
p mt["title"]
mt["title"] = "I changed title"
# TODO don't change body and test
mt["body"] = "I changed body"
mt.save!

mt2 = Quotes.find mt['id']

puts "Title updated: #{mt2['title']} "