// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require jquery.min.js
//= require jquery.scrollUp.js
//= require bootstrap.js
//= require bootstrap-colorpicker.js
//= require date-picker/date.js
//= require date-picker/daterangepicker.js
//= require bootstrap-timepicker.js
//= require jquery.bootstrap.wizard.js
//= require tiny-scrollbar.js
//= require jquery.validate.min.js
//= require jquery.snippet.js
//= require jquery.easy-pie-chart.js
//= require jquery-fileupload/basic
//= require jquery-fileupload/vendor/tmpl
//= require jsapi
//= html5.js

function rubyCodeFormat() {
	


$("pre.ruby").snippet("ruby",{style:"rand01",transparent:true,showNum:true});
    // Finds <pre> elements with the class "js"
    // and snippet highlights the JAVASCRIPT code within
    // using a random style from the selection of 39
    // with a transparent background
    // without showing line numbers.



$("pre.javascript").snippet("javascript",{style:"rand01",transparent:true,showNum:true});
    // Finds <pre> elements with the class "js"
    // and snippet highlights the JAVASCRIPT code within
    // using a random style from the selection of 39
    // with a transparent background
    // without showing line numbers.

};

function coerceToString(val) {
  return String((val === null || val === undefined) ? '' : val);
}

var rAmp = /&/g,
     rLt = /</g,
     rGt = />/g,
     rApos = /\'/g,
     rQuot = /\"/g,
     hChars = /[&<>\"\']/;

function hoganEscape(str) {
    str = coerceToString(str);
    return hChars.test(str) ?
      str
        .replace(rAmp, '&amp;')
        .replace(rLt, '&lt;')
        .replace(rGt, '&gt;')
        .replace(rApos, '&#39;')
        .replace(rQuot, '&quot;') :
      str;
  }

$(document).ready(function(){
	rubyCodeFormat()
});
