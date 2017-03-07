# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(is_provider: true,
            username: 'redranchgrill',
            name: 'Red Ranch Grill',
            email: 'redranch@email.com',
            password: 'password',
            password_confirmation: 'password',
            full_street_address: '220 King St W, Toronto, ON M5H1K4',
            phone: '416-555-1234',
            description: 'Sed chuck pork chop shoulder laborum, pork loin cupidatat dolor landjaeger eiusmod excepteur. Capicola fatback dolore ball tip excepteur kielbasa. Ground round landjaeger exercitation leberkas, ball tip consectetur tri-tip magna in bresaola anim dolore minim. Ut exercitation spare ribs sirloin ribeye aute brisket ex ut beef ribs proident laboris nostrud. ',
            homepage: 'redranchgrill.com',
            photo: '',
            registration: 'RRG12345')
User.create(is_provider: true,
            username: 'BurgerPriest',
            name: 'Burger Priest',
            email: 'bp@burgers.com',
            password: 'password',
            password_confirmation: 'password',
            full_street_address: '212 Adelaide St. W, Toronto, ON M5H1W7',
            phone: '416-555-1234',
            description: 'Sed chuck pork chop shoulder laborum, pork loin cupidatat dolor landjaeger eiusmod excepteur. Capicola fatback dolore ball tip excepteur kielbasa. Ground round landjaeger exercitation leberkas, ball tip consectetur tri-tip magna in bresaola anim dolore minim. Ut exercitation spare ribs sirloin ribeye aute brisket ex ut beef ribs proident laboris nostrud. ',
            homepage: 'burgerpriest.com',
            photo: '',
            registration: 'BPP4567')
