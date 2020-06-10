# -Pets-
pets = { cat: 'fluffy', dog: ['sparky', 'fido'], fish: 'oscar' }

pets[:dog] << 'bowser' # Or pets[:dog].push('bowser')
# pets[:dog] = 'bowser' # Removes the original values.
# Since the value is Array, we can use Array#push.
p pets #=> {:cat=>"fluffy", :dog=>"bowser", :fish=>"oscar"}