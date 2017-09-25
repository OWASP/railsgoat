
Randomized with seed 33309
FFFFFFFFFFFFFFFFFFFFF

Failures:

  1) improper password hashing with just md5
Tutorial: https://github.com/OWASP/railsgoat/wiki/A6-Sensitive-Data-Exposure-Insecure-Password-Storage
     Failure/Error: aes.iv = iv if iv != nil

     ArgumentError:
       iv must be 16 bytes
     # ./lib/encryption.rb:8:in `iv='
     # ./lib/encryption.rb:8:in `encrypt_sensitive_value'
     # ./app/models/user.rb:82:in `generate_token'
     # ./app/models/user.rb:23:in `block in <class:User>'
     # /Users/macbookpro/.rvm/rubies/ruby-2.4.2/lib/ruby/2.4.0/monitor.rb:214:in `mon_synchronize'
     # ./db/seeds.rb:270:in `block in <top (required)>'
     # ./db/seeds.rb:267:in `each'
     # ./db/seeds.rb:267:in `<top (required)>'
     # ./spec/support/user_fixture.rb:4:in `reset_all_users'
     # ./spec/vulnerabilities/password_hashing_spec.rb:5:in `block (2 levels) in <top (required)>'

  2) command injection attack
Tutorial: https://github.com/OWASP/railsgoat/wiki/A1-Command-Injection
     Failure/Error: aes.iv = iv if iv != nil

     ArgumentError:
       iv must be 16 bytes
     # ./lib/encryption.rb:8:in `iv='
     # ./lib/encryption.rb:8:in `encrypt_sensitive_value'
     # ./app/models/user.rb:82:in `generate_token'
     # ./app/models/user.rb:23:in `block in <class:User>'
     # /Users/macbookpro/.rvm/rubies/ruby-2.4.2/lib/ruby/2.4.0/monitor.rb:214:in `mon_synchronize'
     # ./db/seeds.rb:270:in `block in <top (required)>'
     # ./db/seeds.rb:267:in `each'
     # ./db/seeds.rb:267:in `<top (required)>'
     # ./spec/support/user_fixture.rb:4:in `reset_all_users'
     # ./spec/vulnerabilities/command_injection_spec.rb:6:in `block (2 levels) in <top (required)>'

  3) csrf attack
Tutorial: https://github.com/OWASP/railsgoat/wiki/R5-A8-CSRF
     Failure/Error: aes.iv = iv if iv != nil

     ArgumentError:
       iv must be 16 bytes
     # ./lib/encryption.rb:8:in `iv='
     # ./lib/encryption.rb:8:in `encrypt_sensitive_value'
     # ./app/models/user.rb:82:in `generate_token'
     # ./app/models/user.rb:23:in `block in <class:User>'
     # /Users/macbookpro/.rvm/rubies/ruby-2.4.2/lib/ruby/2.4.0/monitor.rb:214:in `mon_synchronize'
     # ./db/seeds.rb:270:in `block in <top (required)>'
     # ./db/seeds.rb:267:in `each'
     # ./db/seeds.rb:267:in `<top (required)>'
     # ./spec/support/user_fixture.rb:4:in `reset_all_users'
     # ./spec/vulnerabilities/csrf_spec.rb:6:in `block (2 levels) in <top (required)>'

  4) url access attack
Tutorial: https://github.com/OWASP/railsgoat/wiki/A7-Missing-Function-Level-Access-Control--(Admin-Controller)
     Failure/Error: aes.iv = iv if iv != nil

     ArgumentError:
       iv must be 16 bytes
     # ./lib/encryption.rb:8:in `iv='
     # ./lib/encryption.rb:8:in `encrypt_sensitive_value'
     # ./app/models/user.rb:82:in `generate_token'
     # ./app/models/user.rb:23:in `block in <class:User>'
     # /Users/macbookpro/.rvm/rubies/ruby-2.4.2/lib/ruby/2.4.0/monitor.rb:214:in `mon_synchronize'
     # ./db/seeds.rb:270:in `block in <top (required)>'
     # ./db/seeds.rb:267:in `each'
     # ./db/seeds.rb:267:in `<top (required)>'
     # ./spec/support/user_fixture.rb:4:in `reset_all_users'
     # ./spec/vulnerabilities/url_access_spec.rb:5:in `block (2 levels) in <top (required)>'

  5) broken_auth one
Tutorial: https://github.com/OWASP/railsgoat/wiki/A2-Credential-Enumeration
     Failure/Error: aes.iv = iv if iv != nil

     ArgumentError:
       iv must be 16 bytes
     # ./lib/encryption.rb:8:in `iv='
     # ./lib/encryption.rb:8:in `encrypt_sensitive_value'
     # ./app/models/user.rb:82:in `generate_token'
     # ./app/models/user.rb:23:in `block in <class:User>'
     # /Users/macbookpro/.rvm/rubies/ruby-2.4.2/lib/ruby/2.4.0/monitor.rb:214:in `mon_synchronize'
     # ./db/seeds.rb:270:in `block in <top (required)>'
     # ./db/seeds.rb:267:in `each'
     # ./db/seeds.rb:267:in `<top (required)>'
     # ./spec/support/user_fixture.rb:4:in `reset_all_users'
     # ./spec/vulnerabilities/broken_auth_spec.rb:5:in `block (2 levels) in <top (required)>'

  6) broken_auth two
Tutorial: https://github.com/OWASP/railsgoat/wiki/A2-Credential-Enumeration
     Failure/Error: aes.iv = iv if iv != nil

     ArgumentError:
       iv must be 16 bytes
     # ./lib/encryption.rb:8:in `iv='
     # ./lib/encryption.rb:8:in `encrypt_sensitive_value'
     # ./app/models/user.rb:82:in `generate_token'
     # ./app/models/user.rb:23:in `block in <class:User>'
     # /Users/macbookpro/.rvm/rubies/ruby-2.4.2/lib/ruby/2.4.0/monitor.rb:214:in `mon_synchronize'
     # ./db/seeds.rb:270:in `block in <top (required)>'
     # ./db/seeds.rb:267:in `each'
     # ./db/seeds.rb:267:in `<top (required)>'
     # ./spec/support/user_fixture.rb:4:in `reset_all_users'
     # ./spec/vulnerabilities/broken_auth_spec.rb:5:in `block (2 levels) in <top (required)>'

  7) xss attack
Tutorial: https://github.com/OWASP/railsgoat/wiki/A3-Cross-Site-Scripting
     Failure/Error: aes.iv = iv if iv != nil

     ArgumentError:
       iv must be 16 bytes
     # ./lib/encryption.rb:8:in `iv='
     # ./lib/encryption.rb:8:in `encrypt_sensitive_value'
     # ./app/models/user.rb:82:in `generate_token'
     # ./app/models/user.rb:23:in `block in <class:User>'
     # /Users/macbookpro/.rvm/rubies/ruby-2.4.2/lib/ruby/2.4.0/monitor.rb:214:in `mon_synchronize'
     # ./db/seeds.rb:270:in `block in <top (required)>'
     # ./db/seeds.rb:267:in `each'
     # ./db/seeds.rb:267:in `<top (required)>'
     # ./spec/support/user_fixture.rb:4:in `reset_all_users'
     # ./spec/vulnerabilities/xss_spec.rb:5:in `block (2 levels) in <top (required)>'

  8) insecure direct object reference attack one
     Failure/Error: aes.iv = iv if iv != nil

     ArgumentError:
       iv must be 16 bytes
     # ./lib/encryption.rb:8:in `iv='
     # ./lib/encryption.rb:8:in `encrypt_sensitive_value'
     # ./app/models/user.rb:82:in `generate_token'
     # ./app/models/user.rb:23:in `block in <class:User>'
     # /Users/macbookpro/.rvm/rubies/ruby-2.4.2/lib/ruby/2.4.0/monitor.rb:214:in `mon_synchronize'
     # ./db/seeds.rb:270:in `block in <top (required)>'
     # ./db/seeds.rb:267:in `each'
     # ./db/seeds.rb:267:in `<top (required)>'
     # ./spec/support/user_fixture.rb:4:in `reset_all_users'
     # ./spec/vulnerabilities/insecure_dor_spec.rb:5:in `block (2 levels) in <top (required)>'

  9) insecure direct object reference attack two
Tutorial: https://github.com/OWASP/railsgoat/wiki/A4-Insecure-Direct-Object-Reference
     Failure/Error: aes.iv = iv if iv != nil

     ArgumentError:
       iv must be 16 bytes
     # ./lib/encryption.rb:8:in `iv='
     # ./lib/encryption.rb:8:in `encrypt_sensitive_value'
     # ./app/models/user.rb:82:in `generate_token'
     # ./app/models/user.rb:23:in `block in <class:User>'
     # /Users/macbookpro/.rvm/rubies/ruby-2.4.2/lib/ruby/2.4.0/monitor.rb:214:in `mon_synchronize'
     # ./db/seeds.rb:270:in `block in <top (required)>'
     # ./db/seeds.rb:267:in `each'
     # ./db/seeds.rb:267:in `<top (required)>'
     # ./spec/support/user_fixture.rb:4:in `reset_all_users'
     # ./spec/vulnerabilities/insecure_dor_spec.rb:5:in `block (2 levels) in <top (required)>'

  10) sql injection attack
Tutorial: https://github.com/OWASP/railsgoat/wiki/R4-A1-SQL-Injection-Concatentation
      Failure/Error: aes.iv = iv if iv != nil

      ArgumentError:
        iv must be 16 bytes
      # ./lib/encryption.rb:8:in `iv='
      # ./lib/encryption.rb:8:in `encrypt_sensitive_value'
      # ./app/models/user.rb:82:in `generate_token'
      # ./app/models/user.rb:23:in `block in <class:User>'
      # /Users/macbookpro/.rvm/rubies/ruby-2.4.2/lib/ruby/2.4.0/monitor.rb:214:in `mon_synchronize'
      # ./db/seeds.rb:270:in `block in <top (required)>'
      # ./db/seeds.rb:267:in `each'
      # ./db/seeds.rb:267:in `<top (required)>'
      # ./spec/support/user_fixture.rb:4:in `reset_all_users'
      # ./spec/vulnerabilities/sql_injection_spec.rb:5:in `block (2 levels) in <top (required)>'

  11) User can be instantiated
      Failure/Error: aes.iv = iv if iv != nil

      ArgumentError:
        iv must be 16 bytes
      # ./lib/encryption.rb:8:in `iv='
      # ./lib/encryption.rb:8:in `encrypt_sensitive_value'
      # ./app/models/user.rb:82:in `generate_token'
      # ./app/models/user.rb:23:in `block in <class:User>'
      # /Users/macbookpro/.rvm/rubies/ruby-2.4.2/lib/ruby/2.4.0/monitor.rb:214:in `mon_synchronize'
      # ./db/seeds.rb:270:in `block in <top (required)>'
      # ./db/seeds.rb:267:in `each'
      # ./db/seeds.rb:267:in `<top (required)>'
      # ./spec/support/user_fixture.rb:4:in `reset_all_users'
      # ./spec/models/benefits_spec.rb:5:in `block (2 levels) in <top (required)>'

  12) User name can be updated
      Failure/Error: aes.iv = iv if iv != nil

      ArgumentError:
        iv must be 16 bytes
      # ./lib/encryption.rb:8:in `iv='
      # ./lib/encryption.rb:8:in `encrypt_sensitive_value'
      # ./app/models/user.rb:82:in `generate_token'
      # ./app/models/user.rb:23:in `block in <class:User>'
      # /Users/macbookpro/.rvm/rubies/ruby-2.4.2/lib/ruby/2.4.0/monitor.rb:214:in `mon_synchronize'
      # ./db/seeds.rb:270:in `block in <top (required)>'
      # ./db/seeds.rb:267:in `each'
      # ./db/seeds.rb:267:in `<top (required)>'
      # ./spec/support/user_fixture.rb:4:in `reset_all_users'
      # ./spec/models/benefits_spec.rb:5:in `block (2 levels) in <top (required)>'

  13) mass assignment attack one
      Failure/Error: aes.iv = iv if iv != nil

      ArgumentError:
        iv must be 16 bytes
      # ./lib/encryption.rb:8:in `iv='
      # ./lib/encryption.rb:8:in `encrypt_sensitive_value'
      # ./app/models/user.rb:82:in `generate_token'
      # ./app/models/user.rb:23:in `block in <class:User>'
      # /Users/macbookpro/.rvm/rubies/ruby-2.4.2/lib/ruby/2.4.0/monitor.rb:214:in `mon_synchronize'
      # ./db/seeds.rb:270:in `block in <top (required)>'
      # ./db/seeds.rb:267:in `each'
      # ./db/seeds.rb:267:in `<top (required)>'
      # ./spec/support/user_fixture.rb:4:in `reset_all_users'
      # ./spec/vulnerabilities/mass_assignment_spec.rb:5:in `block (2 levels) in <top (required)>'

  14) mass assignment attack two, Tutorial: https://github.com/OWASP/railsgoat/wiki/R5-Extras-Mass-Assignment-Admin-Role
      Failure/Error: aes.iv = iv if iv != nil

      ArgumentError:
        iv must be 16 bytes
      # ./lib/encryption.rb:8:in `iv='
      # ./lib/encryption.rb:8:in `encrypt_sensitive_value'
      # ./app/models/user.rb:82:in `generate_token'
      # ./app/models/user.rb:23:in `block in <class:User>'
      # /Users/macbookpro/.rvm/rubies/ruby-2.4.2/lib/ruby/2.4.0/monitor.rb:214:in `mon_synchronize'
      # ./db/seeds.rb:270:in `block in <top (required)>'
      # ./db/seeds.rb:267:in `each'
      # ./db/seeds.rb:267:in `<top (required)>'
      # ./spec/support/user_fixture.rb:4:in `reset_all_users'
      # ./spec/vulnerabilities/mass_assignment_spec.rb:5:in `block (2 levels) in <top (required)>'

  15) password complexity one
Tutorial: https://github.com/OWASP/railsgoat/wiki/A2-Lack-of-Password-Complexity
      Failure/Error: aes.iv = iv if iv != nil

      ArgumentError:
        iv must be 16 bytes
      # ./lib/encryption.rb:8:in `iv='
      # ./lib/encryption.rb:8:in `encrypt_sensitive_value'
      # ./app/models/user.rb:82:in `generate_token'
      # ./app/models/user.rb:23:in `block in <class:User>'
      # /Users/macbookpro/.rvm/rubies/ruby-2.4.2/lib/ruby/2.4.0/monitor.rb:214:in `mon_synchronize'
      # ./db/seeds.rb:270:in `block in <top (required)>'
      # ./db/seeds.rb:267:in `each'
      # ./db/seeds.rb:267:in `<top (required)>'
      # ./spec/support/user_fixture.rb:4:in `reset_all_users'
      # ./spec/vulnerabilities/password_complexity_spec.rb:5:in `block (2 levels) in <top (required)>'

  16) User can be instantiated
      Failure/Error: aes.iv = iv if iv != nil

      ArgumentError:
        iv must be 16 bytes
      # ./lib/encryption.rb:8:in `iv='
      # ./lib/encryption.rb:8:in `encrypt_sensitive_value'
      # ./app/models/user.rb:82:in `generate_token'
      # ./app/models/user.rb:23:in `block in <class:User>'
      # /Users/macbookpro/.rvm/rubies/ruby-2.4.2/lib/ruby/2.4.0/monitor.rb:214:in `mon_synchronize'
      # ./db/seeds.rb:270:in `block in <top (required)>'
      # ./db/seeds.rb:267:in `each'
      # ./db/seeds.rb:267:in `<top (required)>'
      # ./spec/support/user_fixture.rb:4:in `reset_all_users'
      # ./spec/models/user_spec.rb:5:in `block (2 levels) in <top (required)>'

  17) User should require a email
      Failure/Error: aes.iv = iv if iv != nil

      ArgumentError:
        iv must be 16 bytes
      # ./lib/encryption.rb:8:in `iv='
      # ./lib/encryption.rb:8:in `encrypt_sensitive_value'
      # ./app/models/user.rb:82:in `generate_token'
      # ./app/models/user.rb:23:in `block in <class:User>'
      # /Users/macbookpro/.rvm/rubies/ruby-2.4.2/lib/ruby/2.4.0/monitor.rb:214:in `mon_synchronize'
      # ./db/seeds.rb:270:in `block in <top (required)>'
      # ./db/seeds.rb:267:in `each'
      # ./db/seeds.rb:267:in `<top (required)>'
      # ./spec/support/user_fixture.rb:4:in `reset_all_users'
      # ./spec/models/user_spec.rb:5:in `block (2 levels) in <top (required)>'

  18) User should require valid email
      Failure/Error: aes.iv = iv if iv != nil

      ArgumentError:
        iv must be 16 bytes
      # ./lib/encryption.rb:8:in `iv='
      # ./lib/encryption.rb:8:in `encrypt_sensitive_value'
      # ./app/models/user.rb:82:in `generate_token'
      # ./app/models/user.rb:23:in `block in <class:User>'
      # /Users/macbookpro/.rvm/rubies/ruby-2.4.2/lib/ruby/2.4.0/monitor.rb:214:in `mon_synchronize'
      # ./db/seeds.rb:270:in `block in <top (required)>'
      # ./db/seeds.rb:267:in `each'
      # ./db/seeds.rb:267:in `<top (required)>'
      # ./spec/support/user_fixture.rb:4:in `reset_all_users'
      # ./spec/models/user_spec.rb:5:in `block (2 levels) in <top (required)>'

  19) User should require unique email
      Failure/Error: aes.iv = iv if iv != nil

      ArgumentError:
        iv must be 16 bytes
      # ./lib/encryption.rb:8:in `iv='
      # ./lib/encryption.rb:8:in `encrypt_sensitive_value'
      # ./app/models/user.rb:82:in `generate_token'
      # ./app/models/user.rb:23:in `block in <class:User>'
      # /Users/macbookpro/.rvm/rubies/ruby-2.4.2/lib/ruby/2.4.0/monitor.rb:214:in `mon_synchronize'
      # ./db/seeds.rb:270:in `block in <top (required)>'
      # ./db/seeds.rb:267:in `each'
      # ./db/seeds.rb:267:in `<top (required)>'
      # ./spec/support/user_fixture.rb:4:in `reset_all_users'
      # ./spec/models/user_spec.rb:5:in `block (2 levels) in <top (required)>'

  20) User name can be updated
      Failure/Error: aes.iv = iv if iv != nil

      ArgumentError:
        iv must be 16 bytes
      # ./lib/encryption.rb:8:in `iv='
      # ./lib/encryption.rb:8:in `encrypt_sensitive_value'
      # ./app/models/user.rb:82:in `generate_token'
      # ./app/models/user.rb:23:in `block in <class:User>'
      # /Users/macbookpro/.rvm/rubies/ruby-2.4.2/lib/ruby/2.4.0/monitor.rb:214:in `mon_synchronize'
      # ./db/seeds.rb:270:in `block in <top (required)>'
      # ./db/seeds.rb:267:in `each'
      # ./db/seeds.rb:267:in `<top (required)>'
      # ./spec/support/user_fixture.rb:4:in `reset_all_users'
      # ./spec/models/user_spec.rb:5:in `block (2 levels) in <top (required)>'

  21) unvalidated redirect attack
Tutorial: https://github.com/OWASP/railsgoat/wiki/A10-Unvalidated-Redirects-and-Forwards-(redirect_to)
      Failure/Error: aes.iv = iv if iv != nil

      ArgumentError:
        iv must be 16 bytes
      # ./lib/encryption.rb:8:in `iv='
      # ./lib/encryption.rb:8:in `encrypt_sensitive_value'
      # ./app/models/user.rb:82:in `generate_token'
      # ./app/models/user.rb:23:in `block in <class:User>'
      # /Users/macbookpro/.rvm/rubies/ruby-2.4.2/lib/ruby/2.4.0/monitor.rb:214:in `mon_synchronize'
      # ./db/seeds.rb:270:in `block in <top (required)>'
      # ./db/seeds.rb:267:in `each'
      # ./db/seeds.rb:267:in `<top (required)>'
      # ./spec/support/user_fixture.rb:4:in `reset_all_users'
      # ./spec/vulnerabilities/unvalidated_redirects_spec.rb:5:in `block (2 levels) in <top (required)>'

Finished in 0.2747 seconds (files took 2.04 seconds to load)
21 examples, 21 failures

Failed examples:

rspec ./spec/vulnerabilities/password_hashing_spec.rb:9 # improper password hashing with just md5
Tutorial: https://github.com/OWASP/railsgoat/wiki/A6-Sensitive-Data-Exposure-Insecure-Password-Storage
rspec ./spec/vulnerabilities/command_injection_spec.rb:10 # command injection attack
Tutorial: https://github.com/OWASP/railsgoat/wiki/A1-Command-Injection
rspec ./spec/vulnerabilities/csrf_spec.rb:10 # csrf attack
Tutorial: https://github.com/OWASP/railsgoat/wiki/R5-A8-CSRF
rspec ./spec/vulnerabilities/url_access_spec.rb:9 # url access attack
Tutorial: https://github.com/OWASP/railsgoat/wiki/A7-Missing-Function-Level-Access-Control--(Admin-Controller)
rspec ./spec/vulnerabilities/broken_auth_spec.rb:9 # broken_auth one
Tutorial: https://github.com/OWASP/railsgoat/wiki/A2-Credential-Enumeration
rspec ./spec/vulnerabilities/broken_auth_spec.rb:22 # broken_auth two
Tutorial: https://github.com/OWASP/railsgoat/wiki/A2-Credential-Enumeration
rspec ./spec/vulnerabilities/xss_spec.rb:9 # xss attack
Tutorial: https://github.com/OWASP/railsgoat/wiki/A3-Cross-Site-Scripting
rspec ./spec/vulnerabilities/insecure_dor_spec.rb:9 # insecure direct object reference attack one
rspec ./spec/vulnerabilities/insecure_dor_spec.rb:23 # insecure direct object reference attack two
Tutorial: https://github.com/OWASP/railsgoat/wiki/A4-Insecure-Direct-Object-Reference
rspec ./spec/vulnerabilities/sql_injection_spec.rb:10 # sql injection attack
Tutorial: https://github.com/OWASP/railsgoat/wiki/R4-A1-SQL-Injection-Concatentation
rspec ./spec/models/benefits_spec.rb:13 # User can be instantiated
rspec ./spec/models/benefits_spec.rb:17 # User name can be updated
rspec ./spec/vulnerabilities/mass_assignment_spec.rb:9 # mass assignment attack one
rspec ./spec/vulnerabilities/mass_assignment_spec.rb:24 # mass assignment attack two, Tutorial: https://github.com/OWASP/railsgoat/wiki/R5-Extras-Mass-Assignment-Admin-Role
rspec ./spec/vulnerabilities/password_complexity_spec.rb:9 # password complexity one
Tutorial: https://github.com/OWASP/railsgoat/wiki/A2-Lack-of-Password-Complexity
rspec ./spec/models/user_spec.rb:13 # User can be instantiated
rspec ./spec/models/user_spec.rb:17 # User should require a email
rspec ./spec/models/user_spec.rb:21 # User should require valid email
rspec ./spec/models/user_spec.rb:25 # User should require unique email
rspec ./spec/models/user_spec.rb:30 # User name can be updated
rspec ./spec/vulnerabilities/unvalidated_redirects_spec.rb:9 # unvalidated redirect attack
Tutorial: https://github.com/OWASP/railsgoat/wiki/A10-Unvalidated-Redirects-and-Forwards-(redirect_to)

Randomized with seed 33309

