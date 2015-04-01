require 'erubis'

template = <<TEMPLATE
This is a template.
It has <%= some_thing %>.
TEMPLATE

eruby = Erubis::Eruby.new(template)
puts eruby.src
puts "========="
puts eruby.result(some_thing: "Xicaloa")
