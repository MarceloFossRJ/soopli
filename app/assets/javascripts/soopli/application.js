// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require soopli/jquery-3.2.1.min
//= require soopli/rails
//= require_tree .
//= require soopli/tether.min
//= require soopli/bootstrap.min
//= require soopli/bootstrap-datepicker.min
	

$('.form_datetime').datepicker({
    autoclose: true,
    todayBtn: true,
    pickerPosition: "bottom-left",
    format: 'mm-dd-yyyy'
});

$(function () {
    $('[data-toggle="tooltip"]').tooltip()
});



