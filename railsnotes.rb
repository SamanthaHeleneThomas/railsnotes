
# Rails allow us to build scalable applications quickly 
# - twitter
# - github


# to create a new rails app

#     rails new <application name>
        1. created a read me file
        2. intitializes a gemfile
        3. folder called app
        4. inside app is assets
        5. folder called controllers
        6. created a bin directory
        7. config directory 
        8.  creates a database file
        9. runs bundle install

MVC
model view controller

Models are for handling data and business logic
Views are for handing GUI objects
Controllers are for handling user interface logics


User will interact with the application. impact requests. 

models are always singular 


ActiveRecord 

CRUD
create
read                            All of these are logic methods 
update
destory

Active Record is the M in MVC, it is the data and logic. 
Convention over configuration
- a migration is just an update of database

Associations


UML
unified modeling language
visualization of the databases


IRB session

#
bundle exec rails c
# create contacts
Contact.create(name:"Samantha",age: 22, phone:"801-888-8888", email:"2sthomas@gmail.com")

Contact.create(name:"Sarah",age: 22, phone:"801-888-8828", email:"sarahb@gmail.com")

Contact.create(name:"Maya",age: 25, phone:"801-888-4488", email:"mayae@gmail.com")

Contact.create(name:"Nathan",age: 27, phone:"801-848-8888", email:"nathanm@gmail.com")

Contact.create(name:"Britt",age: 20, phone:"801-821-8888", email:"bbills@gmail.com")

# index method
Contact.all
will pull up all of it 

COntact.find
looks at the index

#will find that record
Contact.find (5)

# will find that specific contact
Contact.find_by(varibale: xxx)


Contact.create(vari:x,var:x,var:x)

# similar to find by
Contact.where(phone:555)
#pulls back any record

Contact.first
Contact.find 
        needs id 


Contact.order


Contact.create()

# editing platform
 bundle exec rails c 

Contact.where(name:'Matthew').order(age: :desc)
Contact.where.not(name:'dave')

sam =Contact.new(name:"sam")

Will make anything unfilled nul 
Contact.update (9,phone:"3333333")

Contact.all


bundle exec rails g controller Contacts index show update

katy.update

Contact.update(4, name:"remote",phone: "94990303",)

Contact.find(1).destory
# that space is not empty, it is not filled

Contact.where(name:).destroy_all

Contact.destroyall

Contact.all
Contact.create
bundle exec rails g migration change_name_to_first_name

bundle exec rails c 

you can do migrations within the irb 
        
bundle exec rails bd:migrate

Contact.update(10,last_name:"peter",friend:false)

# all of the above was creating a contact, not a note

bundle exec rails g model note body: text contact:belongs_to

bundle exec rails c 
Note.create(body:"ghjh", contact_id:11)



cart.items.create


orphaned data


validates :points, lengt: {maximum:2}

beofre_validation
before_save
before_create


after_validatoin
after_save
after_create



Rails notes and Lectures from class. Tracing one. 

Creating a new rails app

$ rails new contact_list -d postgresql          here youre creating the project
$ cd contact_list                               here you are moving into the contact_list directory
$ bundle exec rake db:create                    bundle exec calls on a specific function, the db stands for database
                                                so db: xx is saying to your database to perform this function
                                                Examples are: db:create db:drop 


Making models in rails

$ bundle exec rails g model contact             what does the G stand for?

Destroying a model:
$ bundle exec rails d model contact 

Making a contact and defining attributes:

$ bundle rails g model contact name:strong age:integer age:interger phone:strong email:string

Migrations:
Running a migration                                                     migrations are a way for you to alter your database
$ bundle exec rake db:migrate                                           active record tracks which migration have already been run 
Rolling back a migration                                                so all you have to do is update your source a run rake db: migrate
$ bundle exec rake db:rollback
Accessing Rails Console 
$ bundle exec rails c 

Creating a model

>Contact.create(name:'Sam',age; 22, phone: '222-222-2222', email:'2shthomas@gmail.com')
>Contact.create(name:'Trevor', age: 33, phone: '333-333-3333',email:'nonon@yahoo.com')
>Contact.create(name:'Don',age; 93, phone:'444-343-9999', email:'yesysys@hotmail.com')
>Contact.create(name:'Tracy', age: 46, phone:'444-322-9191', email:' heheheh@aol.com')

Retrieving records:

return a single record by id
Contact.find(1)

return the first record that matches
Contact.find_by(name:"Dave")

return all records that match
Contact.where(name:"Dave")

return all records
Contact.all

Advanced Retrieving records:

Contact.order(:age)
Contact.where(name:"Dave").order(age: :desc)
Contact.limit(3)
Contact.where.not(name:'jake')
Contact.where(name:'Dave').where.not(age: 36)

Creating Records in Memory

katy = Contact.new(name:'katy',age:28)
katy.save
katy

Updating Records
Contact.update(6,phone: '333-333-2999')

Updating Records Examples:

update(id,attributes)
Contact.update(2,name:'David', age: 32)

update_attribute
dave= Contact.find(1)
dave.update_attribute(:phone, 'unlisted')

update_attributes
jake= Contact.find(2)
jake.update_attributes(email: 'jake@no.com', age: 222)

Deleting Records:

Contact.find(1).destroy 

Migrations

rails g migration change_name_to_first_name

bundle exec rake db:migrate
bundle exec rails c

There are different types of associations that data and tabs have with one another
belongs_to
has_many
has_one
has_many:through
has_one:through
dependatn 

Associations:

belongs_to 

        class Note <ApplicationRecord
                belongs_to :contact
        end 
        class Contact < ApplicationRecord
                has_many :notes
        end 
        bundle exec rails calledNote create(body:'This is a good person', contact_id: 1)
        Contact.find(1).notes
        dave = Contact.find(1)
        cave.notes.created(body:'Does not return calls')
        dave.notes
has_many

has_one 
        rails g model address state city zip contact:belongs_to
        bundle exec rake db:migrate

class Contact < ApplicationRecord
        has_many :notes
        has_one: address
end

class Address < ApplicationRecord
        belongs_to :contact
end

Address
id              integer
city            string
state           string
zip             string
contact_id      integer

$ bundle exec rails c
dave= Contact.find(1)
dave.create_address(city: 'Draper', state: 'UT',zip: '81444')
dave.address


dependent

class Contact < ActiveRecord: :: Base 
        has_many: notes, dependent: : destroy
        has_one : address, dependent : : destroy 
end 

Validations

confirmation 
inclusion 
length 
numericality 
presence 
uniqueness

Validation:

 confirmation
  class Person <ApplicationRecord
        validates :emails, confirmatoin: true
  end 

        
inclusion 

class Coffee < ActiveRecord:: Base
        validates :size, inclusion:{
                in%w(small medium large),
                message: "%{value} is not a valid size"
        }
end 

length

class Person < ActiveRecord: : Base
        validates: name, length:{minimum: 2}
        validates: bio,length:{maximum: 500}
        validates :password,length:{in:6..20}
        validates :registration_number, length: {is: 6}
end 

numericality 
class Player < ActiveRecord: :Base 
        validates: points, numericality:true
        validates:games_played, numericality:{only_integer:true}
        validates:golf_handicap, numericality: {less_than_equal_to: 40.4, greater_than_or_equal_to: 2}
end

presence 

class Person < ActiveRecord:: Base 
        validates:name, :login, :email, presence:true 
end 

uniqueness 
class Account <ActiveRecord: :Base
        validates: email, uniqueness: true
end 


Validation options 
1. allow_nil
2. allow_blank
3. message
4. on

allow_nil
class Coffee <ActiverRecord: :Base
        validates :size, inclusion: {in: %w(small medium large),
        message: "%{value} is not a valid size"}, allow_nil:true
}

allow_blank
class Topic <ActiveRecord: :Base
        validates :title, length: {is:5}, allow_blank: true
end 

message
class Coffee <ActiveRecord : :Base
        validates : size,inclusion:{in:%w(small medium large),
        message:      
}




