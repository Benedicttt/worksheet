// hide class message for index.html
$(document).ready(function () {
    if(window.orientation == -90 || window.orientation == 90) orient = "landscape";
    if(window.orientation == 0) orient ="portrait";
    console.log(orient)

    switch(orient){
        case 'portrait':
            // alert('portrait');
            console.log("1")
            $(".message").show();
            break;
        case 'landscape':
            console.log("2")
            // alert('landscape');
            $(".message").hide();
            break;
        default:
            break;
    };

});
