# Set up for the application and database. DO NOT CHANGE. #############################
require "sequel"                                                                      #
connection_string = ENV['DATABASE_URL'] || "sqlite://#{Dir.pwd}/development.sqlite3"  #
DB = Sequel.connect(connection_string)                                                #
#######################################################################################

# Database schema - this should reflect your domain model
DB.create_table! :restaurants do
  primary_key :id
  String :title
  String :description, text: true
  String :location
end
DB.create_table! :rsvps do
  primary_key :id
  foreign_key :restaurant_id
  foreign_key :user_id
  Boolean :going
  String :name
  String :email
  String :comments, text: true
end
DB.create_table! :users do
  primary_key :id
  String :name
  String :email
  String :password
end

# Insert initial (seed) data
restaurants_table = DB.from(:restaurants)

restaurants_table.insert(title: "Bacon Burger", 
                    description: "No.1 Bacon Burger in Evanston",
                    location: "Kellogg Global Hub")

restaurants_table.insert(title: "Toshi's Japanese Kitchen", 
                    description: "Authentic Japanese restaurant in Evanston.",
                    location: "1228 Emerson St, Evanston, IL")
