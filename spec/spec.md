Specs:

 Use Sinatra to build the app
 - The app was built using Sinatra and the initial setup was done via Corneal.

 Use ActiveRecord for storing information in a database
 - ActiveRecord was used to store the data in the SQLite database.

 Include more than one model class (e.g. User, Post, Category)
 - There are 3 models in this app:  User, Owner, Job.

 Include at least one has_many relationship on your User model (e.g. User has_many Posts)
 - Job belongs to Owner; Job has and belongs to many Users
 - Owner has many Jobs
 - User has and belongs to many Jobs

 Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
 - Job belongs to Owner; Job has and belongs to many Users
 - Owner has many Jobs
 - User has and belongs to many Jobs

 Include user accounts with unique login attribute (username or email)
 - Users and Owners sign up and login in with email and passwords which are stored in the database.

 Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
 - Owners can create, read, update, & destroy Jobs.
 - Users can read, apply, and unapply to Jobs.

 Ensure that users can't modify content created by other users
 - Owners can only edit and delete Jobs that belong to them.
 - Users can only unapply to Jobs that they've applied to.

 Include user input validations
 BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
 Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
Confirm

 You have a large number of small Git commits
 Your commit messages are meaningful
 You made the changes in a commit that relate to the commit message
 You don't include changes in a commit that aren't related to the commit message