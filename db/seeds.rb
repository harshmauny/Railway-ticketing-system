# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Passenger.destroy_all

Passenger.create!(:name => "admin", :email => "admin@gmail.com", :username => "admin", password: "admin", :address => "test Address", :phone_num => "9196852468", :card_num => "1334324343432123", :is_admin => true)
Passenger.create!(:name => "harsh", :email => "harsh@gmail.com", :username => "harsh", password: "harsh", :address => "harsh Address", :phone_num => "9196852468", :card_num => "1334324343432123", :is_admin => false)
Passenger.create!(:name => "shreshth", :email => "shreshth@gmail.com", :username => "shreshth", password: "shreshth", :address => "shreshth Address", :phone_num => "9196852468", :card_num => "1334324343432123", :is_admin => false)
Passenger.create!(:name => "siddartha", :email => "siddartha@gmail.com", :username => "siddartha", password: "siddartha", :address => "siddartha Address", :phone_num => "9196852468", :card_num => "1334324343432123", :is_admin => false)

Train.destroy_all
Train.create!(:train_num => 12345, :train_capacity => 100, :seats_left => 50, :ticket_price => 25, :terminal_st => "RALEIGH", :departure_st => "DURHAM", :departure_date => Date.today+5, :departure_time => Time.now+ (4 * 3600), :arrival_time => Time.now+ (10 * 3600),:arrival_date => Date.today+6, :rating => 0 )
Train.create!(:train_num => 54321, :train_capacity => 200, :seats_left => 100, :ticket_price => 27, :terminal_st => "DURHAM", :departure_st => "RALEIGH", :departure_date => Date.today+10, :departure_time => Time.now + (15 * 3600), :arrival_time => Time.now+ (17 * 3600),:arrival_date => Date.today+15, :rating => 1 )
Train.create!(:train_num => 12342, :train_capacity => 250, :seats_left => 150, :ticket_price => 36, :terminal_st => "RALEIGH", :departure_st => "CHAPEL", :departure_date => Date.today+4, :departure_time => Time.now+ (12 * 3600), :arrival_time => Time.now+ (20 * 3600),:arrival_date => Date.today+7, :rating => 3 )
