DATA_COUNT=10000000

def age
  rand(100)
end

def name
  "name"
end

def sex
  if rand > 0.5
    "male"
  else
    "female"
  end
end

str = ""
i = 0

DATA_COUNT.times do
  str << "{\"age\":#{age},\"name\":\"#{name}#{i}\",\"sex\":\"#{sex}\"}\n"
  i += 1
end

puts str
