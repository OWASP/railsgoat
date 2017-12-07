
# frozen_string_literal: true
POPULATE_RETIREMENTS = [
      {
        employee_contrib: "1000",
        employer_contrib: "2000",
        total: "4500"
      },
      {
        employee_contrib: "8000",
        employer_contrib: "16000",
        total: "30000"
      },
      {
        employee_contrib: "10000",
        employer_contrib: "20000",
        total: "40000"
      },
      {
        employee_contrib: "3000",
        employer_contrib: "6000",
        total: "12500"
      }

]

POPULATE_PAID_TIME_OFF = [
      {
        sick_days_taken: 2,
        sick_days_earned: 5,
        pto_taken: 5,
        pto_earned: 30
      },
      {
        sick_days_taken: 3,
        sick_days_earned: 6,
        pto_taken: 3,
        pto_earned: 20
      },
      {
        sick_days_taken: 2,
        sick_days_earned: 5,
        pto_taken: 5,
        pto_earned: 30
      },
      {
        sick_days_taken: 1,
        sick_days_earned: 5,
        pto_taken: 10,
        pto_earned: 30
      }

  ]

POPULATE_SCHEDULE = [
        {
          date_begin: Date.new(2014, 7, 30),
          date_end: Date.new(2014, 8, 2),
          event_type: "pto",
          event_desc: "vacation to france",
          event_name: "My 2014 Vacation"

        },
        {
          date_begin: Date.new(2013, 9, 1),
          date_end: Date.new(2013, 9, 12),
          event_type: "pto",
          event_desc: "Going Home to see folks",
          event_name: "Visit Parents"

        },
        {
          date_begin: Date.new(2013, 9, 13),
          date_end: Date.new(2013, 9, 20),
          event_type: "pto",
          event_desc: "Taking kids to Grand Canyon",
          event_name: "AZ Trip"

        },
        {
          date_begin: Date.new(2013, 12, 20),
          date_end: Date.new(2013, 12, 30),
          event_type: "pto",
          event_desc: "Xmas Staycation",
          event_name: "Christmas Leave"
        }

    ]

POPULATE_WORK_INFO = [
    {
      income: "$50,000",
      bonuses: "$10,000",
      years_worked: 2,
      SSN: "666-66-6666",
      DoB: "01-01-1980"
    },
    {
      income: "$40,000",
      bonuses: "$10,000",
      years_worked: 1,
      SSN: "777-77-7777",
      DoB: "01-01-1979"
    },
    {
      income: "$60,000",
      bonuses: "$12,000",
      years_worked: 3,
      SSN: "888-88-8888",
      DoB: "01-01-1981"
    },
    {
      income: "$30,000",
      bonuses: "7,000",
      years_worked: 1,
      SSN: "999-99-9999",
      DoB: "01-01-1982"
    }
  ]

 POPULATE_PERFORMANCE = [
    {
      reviewer: 1,
      comments: "Great job! You are my hero",
      date_submitted: Date.new(2012, 01, 01),
      score: 5
    },
    {
    reviewer: 1,
    comments: "Once again, you've done a great job this year. We greatly appreciate your hard work.",
    date_submitted: Date.new(2013, 01, 01),
    score: 5
    },
    {
      reviewer: 1,
      comments: "Great worker, great attitude for this newcomer!",
      date_submitted: Date.new(2013, 01, 01),
      score: 5
    },
    {
      reviewer: 1,
      comments: "Wow, right out of the gate we've been very impressed but unfortunately, our system doesn't allow us to give you a full 5.0 because other ppl have gotten 5.0 ratings.",
      date_submitted: Date.new(2011, 01, 01),
      score: 4
    },
    {
      reviewer: 1,
      comments: "We highly recommend promotion for this employee! Consistent performer with proven leadership qualities.",
      date_submitted: Date.new(2012, 01, 01),
      score: 5
    },
    {
      reviewer: 1,
      comments: "Right out of the gate has made incredible moves as a newly appointed leader. His only improvement would be more cowbell. Not enough of it.",
      date_submitted: Date.new(2013, 01, 01),
      score: 4
    },
    {
       reviewer: 1,
       comments: "Ehh, you are okay, we will let you stay..... barely",
       date_submitted: Date.new(2013, 01, 01),
       score: 2
     }
  ]
