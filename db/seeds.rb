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
  
  schedule = [
        {
          :user_id => 2,
          :date_begin => Date.new(2014, 7, 30),
          :date_end => Date.new(2014, 8, 2),
          :event_type => "pto",
          :event_desc => "vacation to france",
          :event_name => "My 2014 Vacation"        
          
        },
        {
          :user_id => 3,
          :date_begin => Date.new(2013, 9, 1),
          :date_end => Date.new(2013, 9, 12),
          :event_type => "pto",
          :event_desc => "Going Home to see folks",
          :event_name => "Visit Parents"
          
        },
        {
          :user_id => 4,
          :date_begin => Date.new(2013, 9, 13),
          :date_end => Date.new(2013, 9, 20),
          :event_type => "pto",
          :event_desc => "Taking kids to Grand Canyon",
          :event_name => "AZ Trip"
        
        },
        {
          :user_id => 5,
          :date_begin => Date.new(2013, 12, 20),
          :date_end => Date.new(2013, 12, 30),
          :event_type => "pto",
          :event_desc => "Xmas Staycation",
          :event_name => "Christmas Leave"
        }

    ]
    
  work_info = [
    
    {
      :user_id => 2,
      :income => "$50,000",
      :bonuses => "$10,000",
      :years_worked => 2,
      :SSN => "555-55-5555",
      :DoB => "01-01-1980"         
    },
    {
      :user_id => 3,
      :income => "$40,000",
      :bonuses => "$10,000",
      :years_worked => 1,
      :SSN => "333-33-3333",
      :DoB => "01-01-1979"         
    },
    {
      :user_id => 4,
      :income => "$60,000",
      :bonuses => "$12,000",
      :years_worked => 3,
      :SSN => "444-44-4444",
      :DoB => "01-01-1981"         
    },
    {
      :user_id => 5,
      :income => "$30,000",
      :bonuses => "7,000",
      :years_worked => 1,
      :SSN => "222-22-2222",
      :DoB => "01-01-1982"         
    }   
  ]  


users.each do |user_info|
  user = User.new(user_info.reject {|k| k == :user_id})
  user.user_id = user_info[:user_id]
  user.save
end

retirements.each do |r|
 ret = Retirement.new(r.reject {|k| k == :user_id})
 ret.user_id = r[:user_id]
 ret.save
end  

paid_time_off.each do |pto|
  ptoff = PaidTimeOff.new(pto.reject {|k| k == :user_id})
  ptoff.user_id = pto[:user_id]
  ptoff.save
  
end

schedule.each do |event|
  sched = Schedule.new(event.reject {|k| k == :user_id})
  sched.user_id = event[:user_id]
  sched.save
end

work_info.each do |wi|
  info = WorkInfo.new(wi.reject {|k| k == :user_id})
  info.user_id = wi[:user_id]
  info.save
end