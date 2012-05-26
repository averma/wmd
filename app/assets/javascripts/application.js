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
//= require jquery-1.4.3.min
//= require jquery.fancybox-1.3.4
//= require livevalidation
// require jquery.mousewheel-3.0.4.pack

$(document).ready(function() {
    $("a.fancyframe").fancybox({
        });

    $("#flashnotice").fadeOut(15000);

    $("#signup").click(function(){
        var f19 = new LiveValidation('user_password_confirmation');
        f19.add(Validate.Confirmation, {
            match: 'user_password'
        } );
    })

    $(".contactdelete").click(function(){

        

        })

     
});

function delete_contact(){
    if (!confirm("Are you sure?")){
        return false
    }
   
    
}

