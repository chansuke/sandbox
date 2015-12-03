# String has different id
my_name = 'Taro'
your_name = 'Taro'

# Checkout in console
p my_name.object_id
p your_name.object_id

# How about in Symbol?
p my_name.intern
p your_name.intern

# Symbol has same id in same symbol
p my_name.intern.object_id
p your_name.intern.object_id

# It's really similar in number
my_number = 9999
your_number = 9999

# Number and Id are paired in Ruby
p my_number.object_id
p your_number.object_id

