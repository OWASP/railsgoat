# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#


users = [
     {
       :email => "admin@metacorp.com", 
       :admin => true, :password => "admin1234", 
       :first_name => "Admin", 
       :last_name => "", 
       :user_id =>1 
      },
     {
       :email => "jack@metacorp.com", 
       :admin => false, 
       :password => "yankeessuck", 
       :first_name => "Jack", 
       :last_name => "Mannino", 
       :user_id => 2
     },
     {
       :email => "jim@metacorp.com", 
       :admin => false, 
       :password => "alohaowasp", 
       :first_name => "Jim", 
       :last_name => "Manico", 
       :user_id =>3 
     },
     {
       :email => "mike@metacorp.com", 
       :admin => false, 
       :password => "motorcross1445", 
       :first_name => "Mike", 
       :last_name => "McCabe", 
       :user_id =>4 
      },
     {
       :email => "ken@metacorp.com", 
       :admin => false, 
       :password => "citrusblend", 
       :first_name => "Ken", 
       :last_name => "Johnson", 
       :user_id =>5 
      }
]

retirements = [
      {
        :user_id => 2,
        :employee_contrib => "1000",
        :employer_contrib => "2000",
        :total => "4500"
      },
      {
        :user_id => 3,
        :employee_contrib => "8000",
        :employer_contrib => "16000",
        :total => "30000"
      },
      {
        :user_id => 4,
        :employee_contrib => "10000",
        :employer_contrib => "20000",
        :total => "40000"
      },
      {
        :user_id => 5,
        :employee_contrib => "3000",
        :employer_contrib => "6000",
        :total => "12500"
      }
      
]

paid_time_off = [
      {
        :user_id => 2,
        :sick_days_taken => 2,
        :sick_days_earned => 5,
        :pto_taken => 5,
        :pto_earned => 30
      },
      {
        :user_id => 3,
        :sick_days_taken => 3,
        :sick_days_earned => 6,
        :pto_taken => 3,
        :pto_earned => 20
      },
      {
        :user_id => 4,
        :sick_days_taken => 2,
        :sick_days_earned => 5,
        :pto_taken => 5,
        :pto_earned => 30
      },
      {
        :user_id => 5,
        :sick_days_taken => 1,
        :sick_days_earned => 5,
        :pto_taken => 10,
        :pto_earned => 30
      }
  
  ]


users.each do |user_info|
  User.create!(user_info)
end

retirements.each do |r|
 Retirement.create!(r)
end  

paid_time_off.each do |pto|
  PaidTimeOff.create!(pto)
end