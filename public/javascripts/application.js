// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function() {
    $('a').click(function() {
        var img = $(this).after("<img src='/images/loader.gif'/>");


        
        var query = $(this).html();
        var div = $(this).next();
        
        $.getJSON('/search?q=' + query, function(data) {
            img.next().remove();
            img.next().show('fast');
            
            $.each(data, function(i, element) {
                var p = document.createElement('p');
                var link = document.createElement('a');
                link.setAttribute('href', element['url']);
                var txt = document.createTextNode(element['artist'] + ' - ' + element['title']);
                link.appendChild(txt);
                p.appendChild(link);
                img.append($(p));
                
                //img.append("<a href='" + element['url']+ "'>" + element['artist'] + ' - ' + element['title'] + "</a><br/>")
            })
        });
        
        return false;
    })
})