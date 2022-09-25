// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
//= require zeroclipboard
//= require jquery2
//= require jquery_ujs
//= require_tree
//= require bootstrap
//= require bootstrap-sprockets
//= require bootstrap-select
//= require clipboard
//= require money-format

//= require action_cable
//= require_self
//= require_tree ./channels
//= require jquery.autosize
//= require bootstrap/alert
//= require bootstrap/dropdown
//= require bootag.js
//= require json-formatter
//= require bootstrap-datepicker

//= require toastr

"./app/assets/javascripts/"

$(document).ready(function(){
    toastr.options = {
        "closeButton": true,
        "debug": false,
        "progressBar": true,
        "positionClass": "toast-top-right",
        "showDuration": "500000",
        "hideDuration": "500",
        "timeOut": "5000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    };

    $( document ).ajaxStart(function() {
        $('#overlay').show();
    });

    $( document ).ajaxStop(function() {
        $('#overlay').hide();
    });

    $(document).ready(function () {
        var $containerHeight = $(window).height();
        if ($containerHeight <= 818) {
            $('body').css({
                position: 'static',
                bottom: 'auto',
                left: 'auto',
                zoom: 0.5
            });
        }
        if ($containerHeight > 819) {
            $('body').css({
                position: 'absolute',
                bottom: '3px',
                left: '0px',
                zoom: 1
            });
        }
    });
});
