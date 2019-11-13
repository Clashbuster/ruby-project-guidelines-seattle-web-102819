# require 'json'

file = File.read('/Users/flatironschool/Desktop/Ruby, coding/ruby-project-guidelines-seattle-web-102819/db/dictionary.json')
data_hash = JSON.parse(file)

#iterate over the entire dictionary which is a hash of k:v where key is the word and value is a list of definitions
def persist_data(data)
data.each do |k,v|

    # sanatize the k(the word)
    word_char_array = k.split(//)
    sanatized_word = word_char_array.delete_if {|i| i == ""}
    word_length = sanatized_word.length

    # sanatize the value(list of definitions)
    arr = v.split(/\d\. /)
    sanatized_definitions = arr.reject { |e| e.empty? }

    # persist the k(word) into the database and assigns the instance to a temperary variable
    w = Word.create(name: k, word_length: word_length, num_of_definitions: sanatized_definitions.length)
    word_id = w.id

# apply sanatized definitions to seperate variables so it can be easily injected
    
    one = sanatized_definitions[0]
    two = sanatized_definitions[1]
    three = sanatized_definitions[2]
    four = sanatized_definitions[3]
    five = sanatized_definitions[4]
    six = sanatized_definitions[5]
    seven = sanatized_definitions[6]
    eight = sanatized_definitions[7]
    nine = sanatized_definitions[8]
    ten = sanatized_definitions[9]


# inject sanatized definitions into database
    d = Definition.create(word_id: word_id, record1: one, record2: two, record3: three, record4: four, record5: five, record6: six, record7: seven, record8: eight, record9: nine, record10: ten)
   
    end
end

persist_data(data_hash)

# sample_definition = "1. One who slaughters animals, or dresses their flesh for market; one whose occupation it is to kill animals for food. 2. A slaughterer; one who kills in large numbers, or with unusual cruelty; one who causes needless loss of life, as in battle. \"Butcher of an innocent child.\" Shak. Butcher bird (Zoöl.), a species of shrike of the genus Lanius. Note: The Lanius excubitor is the common butcher bird of Europe. In England, the bearded tit is sometimes called the lesser butcher bird. The American species are L.borealis, or northernbutcher bird, and L. Ludovicianus or loggerhead shrike. The name butcher birdis derived from its habit of suspending its prey impaled upon thorns, after killing it. Butcher's meat, such flesh of animals slaughtered for food as is sold for that purpose by butchers, as beef, mutton, lamb, and pork.\n\n1. To kill or slaughter (animals) for food, or for market; as, to butcher hogs. 2. To murder, or kill, especially in an unusually bloody or barbarous manner. Macaulay. [Ithocles] was murdered, rather butchered. Ford."
# p sample_definition.split(/\d\. /)



# important information to consider.
# it takes approximately 7 minutes to seed this database on my machine (macbook air)
# There are approximately 102,216 words in this database



