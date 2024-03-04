# Travel on "RAILS" 
http://152.7.177.194:8080/

A web application for railway ticket management system with login and signup system, booking tickets, cancelling tickets, view ticket history, updating profile, posting reviews and other integrated features.

## Admin credentials
Email: admin@gmail.com

Password: admin

## Running the application
### clone the repo in your local system
``` 
git clone <clone url>
cd CS517-Rail-Ticketing-System
```
### Install gems
``` 
bundle install
```
### migration
``` 
rails db:migrate
```
### get predefined table and users in DB
``` 
rails db:seed
```
### run the application
``` 
rails s
```

## Running application test
``` 
rspec
```

## Application Flows

![image](https://media.github.ncsu.edu/user/30648/files/3a46e48f-cb39-4ddf-b6e9-f08352ced351)

### Homepage

![image](https://media.github.ncsu.edu/user/30648/files/3d83cacf-f8a7-4c0d-bcf3-8f74586f5f0d)

Signup page with validations

### Login Page
![image](https://media.github.ncsu.edu/user/30648/files/f5a5be3f-2c1c-4e8f-a77e-6a3be4405248)


![image](https://media.github.ncsu.edu/user/30648/files/99f7dcf3-1e07-491d-906e-6156fbb95ac1)

Index page after login

### VIEW TRAINS:

![image](https://media.github.ncsu.edu/user/30648/files/662a2b57-c506-4ef0-adef-80cbb7ba422c)

Display all trains with available seats

![image](https://media.github.ncsu.edu/user/30648/files/0f29ad5e-d0f2-4a47-915c-9fd3a0cfe02b)
![image](https://media.github.ncsu.edu/user/30648/files/e7e0bf83-7cbd-4296-be2c-16836a37ac63)


Filtered results by station and rating

### PROFILE:

![image](https://media.github.ncsu.edu/user/30648/files/421b6ebc-bc79-42e4-80d6-1b89d5f8f600)

“Profile” button views the current users profile and gives edit access to the user.

### TRIP HISTORY:

![image](https://media.github.ncsu.edu/user/30648/files/94dfd3f7-88d5-4c55-91e1-c0b1b03b18f0)

View tickets booked by the current user. Reviews can only be added to tickets booked by the user. passenger can also view tickets booked by other users

![image](https://media.github.ncsu.edu/user/30648/files/2413655c-c851-4fce-b0dc-a2ee4007049c)

“Show” page of the ticket booked by the user.

### REVIEWS:

![image](https://media.github.ncsu.edu/user/30648/files/167fa60c-3f54-4776-b911-3b3871ca67aa)

“Reviews” page

![image](https://media.github.ncsu.edu/user/30648/files/069f9750-0b93-4d56-9fb9-e1e875099c10)

Filtered results

![image](https://media.github.ncsu.edu/user/30648/files/13f77296-0d93-4b7e-a85f-631cf7b296d4)

“Show review” page

![image](https://media.github.ncsu.edu/user/30648/files/6bb83f65-a8b2-452b-9ed2-93f2b41ead35)

Only the author of the review can edit their reviews, apart from admin.

### ADMIN :

![image](https://media.github.ncsu.edu/user/30648/files/da8dc9aa-48ac-4358-870d-4d3c89391de6)

Admin index page has:

View all users

Search Train to get Users

View all trains

View trip history

Profile

Reviews

Logout

View all users :

![image](https://media.github.ncsu.edu/user/30648/files/9510acd0-464c-4775-ba74-a37da7e61285)

Admin can view all the users

Admin can create new user

Admin can create edit and delete users

View all trains :

![image](https://media.github.ncsu.edu/user/30648/files/fe68a3c5-012d-4208-9f12-40932e7c51c0)
     
Admin can view all trains

Admin can add a new train

Admin can edit and destroy a train

Admin can book a ticket

View trip history :
![image](https://media.github.ncsu.edu/user/30648/files/ec00b57e-1a77-4ca7-849d-fb5996f7350c)

Admin can view all the history of tickets booked

Admin can cancel a ticket and write review on a ticket

Profile :

![image](https://media.github.ncsu.edu/user/30648/files/cc6df232-8698-45f7-8dd9-c916d13cc8fe)

Admin can see his profile but can edit only some specified fields. Also admin cannot delete his/her own account

Reviews :

![image](https://media.github.ncsu.edu/user/30648/files/d1553c9f-2870-407e-8d73-c7a4cdc78e7b)

Admin can write his reviews and can also edit, delete others reviews

