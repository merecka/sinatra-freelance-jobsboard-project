job1=Job.create(:title => "Web Developer", :job_hours => "Full-time", :job_description => "My first job!", :salary => 100000)
job2=Job.create(:title => "JavaScript Developer", :job_hours => "Full-time", :job_description => "A great job!", :salary => 150000)
job3=Job.create(:title => "Ruby Developer", :job_hours => "Full-time", :job_description => "Best job ever!", :salary => 200000)
owner1=Owner.create(:owner_name => "Facebook", :email => "ceo@facebook.com", :password => "password")
owner2=Owner.create(:owner_name => "Microsoft", :email => "gates@microsoft.com", :password => "password")
owner3=Owner.create(:owner_name => "Apple", :email => "jobs@apple.com", :password => "password")
user1=User.create(:user_name => "Alex", :email => "alex@test.com", :password => "password")
user2=User.create(:user_name => "Bob", :email => "bob@test.com", :password => "password")
user3=User.create(:user_name => "Jim", :email => "jim@test.com", :password => "password")

job1.owner = owner1
job1.save

job2.owner = owner2
job2.save

job3.owner = owner3
job3.save

