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
//= require wysiwyg/wysihtml5-0.3.0.js
//= require jquery.min.js
//= require bootstrap.js
//= require jquery.scrollUp.js
//= require wysiwyg/bootstrap-wysihtml5.js
//= require date-picker/date.js
//= require date-picker/daterangepicker.js
//= require jquery.sparkline.js
//= require tiny-scrollbar.js
//= require jquery.validate.js
//= require jquery.snippet.js
//= require jquery.easy-pie-chart.js


function rubyCodeFormat() {

$("pre.ruby").snippet("ruby",{style:"rand01",transparent:true,showNum:true});
    // Finds <pre> elements with the class "js"
    // and snippet highlights the JAVASCRIPT code within
    // using a random style from the selection of 39
    // with a transparent background
    // without showing line numbers.

};

function pieChartHome() {
    $(function () {
      //create instance
      $('.chart1').easyPieChart({
        animate: 2000,
        barColor: '#e26666',
        trackColor: '#dddddd',
        scaleColor: '#e26666',
        size: 160,
        lineWidth: 7,
      });
      //update instance after 5 sec
      setTimeout(function () {
        $('.chart1').data('easyPieChart').update(50);
      }, 5000);
      setTimeout(function () {
        $('.chart1').data('easyPieChart').update(70);
      }, 10000);
      setTimeout(function () {
        $('.chart1').data('easyPieChart').update(30);
      }, 15000);
      setTimeout(function () {
        $('.chart1').data('easyPieChart').update(90);
      }, 19000);
      setTimeout(function () {
        $('.chart1').data('easyPieChart').update(40);
      }, 32000);
    });

    $(function () {
      //create instance
      $('.chart2').easyPieChart({
        animate: 2000,
        barColor: '#b5799e',
        trackColor: '#dddddd',
        scaleColor: '#b5799e',
        size: 160,
        lineWidth: 7,
      });
      //update instance after 5 sec
      setTimeout(function () {
        $('.chart2').data('easyPieChart').update(90);
      }, 10000);
      setTimeout(function () {
        $('.chart2').data('easyPieChart').update(40);
      }, 18000);
      setTimeout(function () {
        $('.chart2').data('easyPieChart').update(70);
      }, 28000);
      setTimeout(function () {
        $('.chart2').data('easyPieChart').update(50);
      }, 32000);
      setTimeout(function () {
        $('.chart2').data('easyPieChart').update(80);
      }, 40000);
    });

    $(function () {
      //create instance
      $('.chart3').easyPieChart({
        animate: 2000,
        barColor: '#579da9',
        trackColor: '#dddddd',
        scaleColor: '#579da9',
        size: 160,
        lineWidth: 7,
      });
      //update instance after 5 sec
      setTimeout(function () {
        $('.chart3').data('easyPieChart').update(20);
      }, 9000);
      setTimeout(function () {
        $('.chart3').data('easyPieChart').update(59);
      }, 20000);
      setTimeout(function () {
        $('.chart3').data('easyPieChart').update(38);
      }, 35000);
      setTimeout(function () {
        $('.chart3').data('easyPieChart').update(79);
      }, 49000);
      setTimeout(function () {
        $('.chart3').data('easyPieChart').update(96);
      }, 52000);
    });

    $(function () {
      //create instance
      $('.chart4').easyPieChart({
        animate: 2000,
        barColor: '#dba26b',
        trackColor: '#dddddd',
        scaleColor: '#dba26b',
        size: 160,
        lineWidth: 7,
      });
      //update instance after 5 sec
      setTimeout(function () {
        $('.chart4').data('easyPieChart').update(40);
      }, 6000);
      setTimeout(function () {
        $('.chart4').data('easyPieChart').update(67);
      }, 14000);
      setTimeout(function () {
        $('.chart4').data('easyPieChart').update(43);
      }, 23000);
      setTimeout(function () {
        $('.chart4').data('easyPieChart').update(80);
      }, 36000);
      setTimeout(function () {
        $('.chart4').data('easyPieChart').update(66);
      }, 41000);
    });


    $(function () {
      //create instance
      $('.chart5').easyPieChart({
        animate: 3000,
        barColor: '#1e825e',
        trackColor: '#dddddd',
        scaleColor: '#1e825e',
        size: 160,
        lineWidth: 7,
      });
      //update instance after 5 sec
      setTimeout(function () {
        $('.chart5').data('easyPieChart').update(30);
      }, 9000);
      setTimeout(function () {
        $('.chart5').data('easyPieChart').update(87);
      }, 19000);
      setTimeout(function () {
        $('.chart5').data('easyPieChart').update(28);
      }, 27000);
      setTimeout(function () {
        $('.chart5').data('easyPieChart').update(69);
      }, 39000);
      setTimeout(function () {
        $('.chart5').data('easyPieChart').update(99);
      }, 47000);
    });

  }

$(document).ready(function(){
	rubyCodeFormat()
});