function validation(){
	$("#account_edit").validate({
	    rules: {
	        "user[password]": {
	            required: false,
	            minlength: 8
	        },
	        "user[password_confirmation]": {
	            required: false,
	            minlength: 8,
	            equalTo: "#user_password"
	        }
	    },
	    messages: {
	        "user[password]": {
	            minlength: "Your password must be at least 8 characters long"
	        },
	        "user[password_confirmation]": {
	            minlength: "Your password must be at least 8 characters long",
	            equalTo: "Please enter the same password as above"
	        }
	    },
	  	highlight: function(label) {
					$("#submit_button").attr('disabled','disabled');
			    	$(label).closest('.control-group').addClass('error');
			        $('.error').css({"color": "red"});
	    },
		success: function(label) {
			    	label.closest('.control-group').addClass('success');
					$("#submit_button").removeAttr('disabled');
					$('.error').css({"color": "#333333"});
		}
	});
};

$(document).ready(validation());