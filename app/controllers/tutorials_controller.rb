class TutorialsController < ApplicationController
  
  skip_before_filter :has_info
  skip_before_filter :authenticated
  
  def index
  end
  
  def credentials
    render :partial => "layouts/tutorial/credentials/creds"
  end
  
  def show
    render "injection"
  end
  
  def injection
  
  end
  
  def xss
      	@code = %{
  					<li style="color: #FFFFFF">
  						<!-- 
  						I'm going to use HTML safe because we had some weird stuff
  						going on with funny chars and jquery, plus it says safe so I'm guessing
  						nothing bad will happen
  						-->
  						Welcome, <%= current_user.first_name.html_safe %>
  			   	</li>
  			   		}
  end
  
  def broken_auth
  end
  
  def insecure_dor
  end
  
  def csrf
    @meta_code_bad = %{<%#= csrf_meta_tags %> <!-- <~ What is this for? I hear it helps w/ JS and Sea-surfing.....whatevz -->}
    @meta_code_good = %{<%= csrf_meta_tags %> }
    @ajax_code_good = %q{
      ("#example_submit_button_id").click(function(event) {
          var valuesToSubmit = $("#example_form_id").serialize();
          event.preventDefault();
          $.ajax(\{
            url: "/example",
      	  data: valuesToSubmit,
      	  type: "POST",
      	  success: function(response) \{
      		  alert('success!');
      	  },
      	  error: function(event) \{
      		 alert('failure!');
      	  \}
      	\});
      \});
      
    \} }
  end
  
  def misconfig
  end
  
  def crypto
  end
  
  def url_access
  end
  
  def ssl_tls
  end
  
  def redirects
  end
  
  def guard
  end
  
  def info_disclosure
    @bad_code_1 = 
    %q{
    <table class="table table-bordered table-striped">
            <thead>
              <tr>
				<th style="width:16%">Full Name</th>
                <th style="width:16%">Income</th>
                <th style="width:16%">Bonuses</th>
                <th style="width:16%">Years w/ MetaCorp</th>
                <th style="width:16%">SSN</th>
				<th style="width:16%">DoB</th>
              </tr>
            </thead>
            <tbody>
            
			  <tr>
                <td><%= "#{@user.first_name} #{@user.last_name}" %></td>
                <td><%= @user.work_info.income %></td>
                <td><%= @user.work_info.bonuses %></td>
                <td><%= @user.work_info.years_worked %></td>
				<td class="ssn"><%= @user.work_info.SSN %></td>
				<td><%= @user.work_info.DoB %></td>
              </tr>
           
            </tbody>
          </table>
      }
    
    @good_code_1 = %q{
      class WorkInfo < ActiveRecord::Base
        attr_accessible :DoB, :SSN, :bonuses, :income, :years_worked
        belongs_to :user

        # We should probably use this
        def last_four
          "***-**-" << self.SSN[-4,4]
        end

      end
    }  
    
  @bad_code_2 = %q{<td class="ssn"><%= @user.work_info.SSN %></td>}
  @good_code_2 = %q{<td class="ssn"><%= @user.work_info.last_four %></td>}  
  end
  
  def mass_assignment
  end
  
  def constantize
  end
  
end
