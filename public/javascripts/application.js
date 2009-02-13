// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function() {
    $('a.song_link').click(function() {
        var img = $(this).after("<img src='/images/loader.gif'/>");


        
        var query = $(this).html();
        var div = $(this).next();
        
        $.getJSON('/search?q=' + query, function(data) {
            img.next().remove();
            img.next().show('fast');
            
            $.each(data, function(i, element) {
                img.append("<p><a href='" + element['url']+ "'>" + element['artist'] + ' - ' + element['title'] + "</a><br/></p>")
            })
        });
        
        return false;
    })
})