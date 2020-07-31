$(document).ready(function(){loadSlider()})
function loadSlider(){
    //create the slider
    var slider = document.getElementById('my-slider');
    noUiSlider.create(slider, {
        start: [0, 100],
        connect: true,
        range: {
            'min': 0,
            'max': 100
        }
    });

    //event for the display of the slider range
    slider.noUiSlider.on('update',function(values,handler){
        document.getElementById("first").innerHTML="$"+values[0];
        document.getElementById("second").innerHTML="$"+values[1];
    });
}
function dropDown(el){
    //$(el).find(".child").slideDown('slow');
    $(el).find(".child").css({'color':'black','margin-top': 50,'background-color': 'transparent'
    }).fadeIn().animate({'margin-top': 8,'opacity': 1}, 'slow');

    $(el).mouseleave(function(){
        $(el).find('.child').animate({'margin-top':50},'slow').fadeOut('slow');
    });

    $(el).hover(function(){
        $(el).css({'color':'orange'});
    },function(){
        $(el).css({'color':'black'});
    });

    $(".child > li").hover(function(){
        $(this).css({'color':'orange'});
    },function(){
        $(this).css({'color':'black'});
    });
}