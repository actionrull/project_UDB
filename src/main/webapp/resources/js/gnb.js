
 $(document).ready(function() {
      //$('ul.dropdownmenu li ul').hide();
      //$('.menu_box').hide();

      $('ul.dropdownmenu').hover(
         function() { 
            $('ul.dropdownmenu li.gnbmenu ul').fadeIn('normal',function(){$(this).stop();});
            $('#headerArea').animate({height:340},'fast').clearQueue();
         },
        function() {
            $('ul.dropdownmenu li.gnbmenu ul').fadeOut('fast');
            $('#headerArea').animate({height:184},'fast').clearQueue();
       });

       $('ul.dropdownmenu li.gnbmenu').hover(
         function() { 
            $('.depth1', this).animate({top:-42},'fast').clearQueue();
         },
        function() {
           $('.depth1', this).animate({top:0},'fast').clearQueue();
       });
     
       $('ul.dropdownmenu li.gnbmenu .depth1').bind('focus', function () {        
                    $('ul.dropdownmenu li.gnbmenu ul').slideDown('fast');
                    $('#headerArea').animate({height:340},'fast').clearQueue();
          });

         $('ul.dropdownmenu li.m6 li:last').find('a').bind('blur', function () {        
                  $('ul.dropdownmenu li.gnbmenu ul').slideUp('fast');
                  $('#headerArea').animate({height:184},'fast').clearQueue();
         });
     
});