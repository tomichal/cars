// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function() {
    $('a').click(function() {
        //$(this).next().toggle('fast');
        $(this).after("<img src='/images/loader.gif'/>");
        
        var query = $(this).html();
        
        $.getJSON('/search?q=' + query);
        
        return false;
    })
})