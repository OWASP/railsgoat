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

  def insecure_components
  end

  def access_control
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

  def logic_flaws
  end

  def mass_assignment
  end

  def guantlt

  end

  def metaprogramming
  end
end
