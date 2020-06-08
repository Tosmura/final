This is a website to review your favorite restaurants.
You can see my website from https://aqueous-everglades-35005.herokuapp.com/

User Stories

As a food lover, I want brouse restraunt review
As a food lover, I want to write a review to let people know my favorite restaurant
As a food lover, I want to learn new restaurants

Domain Model

restaurants DB
  primary_key :id
  String :title
  String :description, text: true
  String :location

reviews DB
  primary_key :id
  foreign_key :restaurant_id
  foreign_key :user_id
  Boolean :going
  String :name
  String :email
  String :comments, text: true

users DB
  primary_key :id
  String :name
  String :email
  String :password
