require "json"

def terraform_apply
  length = 2
  pet = resource("random_pet", "this", length: length) # returns pet output
  output("pet", pet)
end

def resource(type, name, attrs={})
  resource_mock(type, name, attrs)
end

def output(name, value)
  {name => value}
end

def resource_mock(type, name, attrs)
  {
    id: "yellow-unicorn", # mock
    length: attrs[:length],
    separator: "-",
  }
end

if __FILE__ == $0
  out = terraform_apply
  puts "Outputs:"
  # mimic terraform output format
  lines = JSON.pretty_generate(out)
  lines = lines.gsub(':', ' =')[1..-2].split("\n").map { |l| l.sub(',','')[2..-1] }
  puts lines
end
