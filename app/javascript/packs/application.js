// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")


$(document).ready(() => {

  function makeTimer() {

      var endTime = new Date("21 June 2020 10:00:00 GMT+09:00");			
        endTime = (Date.parse(endTime) / 1000);
  
        var now = new Date();
        now = (Date.parse(now) / 1000);
  
        var timeLeft = endTime - now;
  
        var days = Math.floor(timeLeft / 86400); 
        var hours = Math.floor((timeLeft - (days * 86400)) / 3600);
        var minutes = Math.floor((timeLeft - (days * 86400) - (hours * 3600 )) / 60);
        var seconds = Math.floor((timeLeft - (days * 86400) - (hours * 3600) - (minutes * 60)));
    
        if (hours < "10") { hours = "0" + hours; }
        if (minutes < "10") { minutes = "0" + minutes; }
        if (seconds < "10") { seconds = "0" + seconds; }
  
        $("#days").html(days + "<span class='timer-span'>Days</span>");
        $("#hours").html(hours + "<span class='timer-span'>Hours</span>");
        $("#minutes").html(minutes + "<span class='timer-span'>Minutes</span>");
        $("#seconds").html(seconds + "<span class='timer-span'>Seconds</span>");		
  
    }
  
    setInterval(function() { makeTimer(); }, 1000);
//////////////////// List Loader //////////////////////////

var mincount = 20;
var maxcount = 40;

$("window").scroll(function() {

  if($("window").scrollTop() + $("window").height() >= $(document).height() - 400) {
    
    $(".user-index-body li").slice(mincount,maxcount).fadeIn(1000);

    mincount = mincount+20;
    maxcount = maxcount+20;

  }
});

/* ===========================================================
 * jquery-simple-text-rotator.js v1
 * ===========================================================
 * Copyright 2013 Pete Rojwongsuriya.
 * http://www.thepetedesign.com
 *
 * A very simple and light weight jQuery plugin that 
 * allows you to rotate multiple text without changing 
 * the layout
 * https://github.com/peachananr/simple-text-rotator
 *
 * ========================================================== */
//= require filterrific/filterrific-jquery



!function($){
  
    var defaults = {
          animation: "dissolve",
          separator: ",",
          speed: 2000
      };
      
      $.fx.step.textShadowBlur = function(fx) {
      $(fx.elem).prop('textShadowBlur', fx.now).css({textShadow: '0 0 ' + Math.floor(fx.now) + 'px black'});
    };
      
    $.fn.textrotator = function(options){
      var settings = $.extend({}, defaults, options);
      
      return this.each(function(){
        var el = $(this)
        var array = [];
        $.each(el.text().split(settings.separator), function(key, value) { 
          array.push(value); 
        });
        el.text(array[0]);
        
        // animation option
        var rotate = function() {
          switch (settings.animation) { 
            case 'dissolve':
              el.animate({
                textShadowBlur:5,
                opacity: 0
              }, 2000 , function() {
                index = $.inArray(el.text(), array)
                if((index + 1) == array.length) index = -1
                el.text(array[index + 1]).animate({
                  textShadowBlur:0,
                  opacity: 1
                }, 2000 );
              });
            break;
            
            case 'flip':
              if(el.find(".back").length > 0) {
                el.html(el.find(".back").html())
              }
            
              var initial = el.text()
              var index = $.inArray(initial, array)
              if((index + 1) == array.length) index = -1
              
              el.html("");
              $("<span class='front'>" + initial + "</span>").appendTo(el);
              $("<span class='back'>" + array[index + 1] + "</span>").appendTo(el);
              el.wrapInner("<span class='rotating' />").find(".rotating").hide().addClass("flip").show().css({
                "-webkit-transform": " rotateY(-180deg)",
                "-moz-transform": " rotateY(-180deg)",
                "-o-transform": " rotateY(-180deg)",
                "transform": " rotateY(-180deg)"
              })
              
            break;
            
            case 'flipUp':
              if(el.find(".back").length > 0) {
                el.html(el.find(".back").html())
              }
            
              var initial = el.text()
              var index = $.inArray(initial, array)
              if((index + 1) == array.length) index = -1
              
              el.html("");
              $("<span class='front'>" + initial + "</span>").appendTo(el);
              $("<span class='back'>" + array[index + 1] + "</span>").appendTo(el);
              el.wrapInner("<span class='rotating' />").find(".rotating").hide().addClass("flip up").show().css({
                "-webkit-transform": " rotateX(-180deg)",
                "-moz-transform": " rotateX(-180deg)",
                "-o-transform": " rotateX(-180deg)",
                "transform": " rotateX(-180deg)"
              })
              
            break;
            
            case 'flipCube':
              if(el.find(".back").length > 0) {
                el.html(el.find(".back").html())
              }
            
              var initial = el.text()
              var index = $.inArray(initial, array)
              if((index + 1) == array.length) index = -1
              
              el.html("");
              $("<span class='front'>" + initial + "</span>").appendTo(el);
              $("<span class='back'>" + array[index + 1] + "</span>").appendTo(el);
              el.wrapInner("<span class='rotating' />").find(".rotating").hide().addClass("flip cube").show().css({
                "-webkit-transform": " rotateY(180deg)",
                "-moz-transform": " rotateY(180deg)",
                "-o-transform": " rotateY(180deg)",
                "transform": " rotateY(180deg)"
              })
              
            break;
            
            case 'flipCubeUp':
              if(el.find(".back").length > 0) {
                el.html(el.find(".back").html())
              }
            
              var initial = el.text()
              var index = $.inArray(initial, array)
              if((index + 1) == array.length) index = -1
              
              el.html("");
              $("<span class='front'>" + initial + "</span>").appendTo(el);
              $("<span class='back'>" + array[index + 1] + "</span>").appendTo(el);
              el.wrapInner("<span class='rotating' />").find(".rotating").hide().addClass("flip cube up").show().css({
                "-webkit-transform": " rotateX(180deg)",
                "-moz-transform": " rotateX(180deg)",
                "-o-transform": " rotateX(180deg)",
                "transform": " rotateX(180deg)"
              })
              
            break;
            
            case 'spin':
              if(el.find(".rotating").length > 0) {
                el.html(el.find(".rotating").html())
              }
              index = $.inArray(el.text(), array)
              if((index + 1) == array.length) index = -1
              
              el.wrapInner("<span class='rotating spin' />").find(".rotating").hide().text(array[index + 1]).show().css({
                "-webkit-transform": " rotate(0) scale(1)",
                "-moz-transform": "rotate(0) scale(1)",
                "-o-transform": "rotate(0) scale(1)",
                "transform": "rotate(0) scale(1)"
              })
            break;
            
            case 'fade':
              el.fadeOut(settings.speed, function() {
                index = $.inArray(el.text(), array)
                if((index + 1) == array.length) index = -1
                el.text(array[index + 1]).fadeIn(settings.speed);
              });
            break;
          }
        };
        setInterval(rotate, settings.speed);
      });
    }
    
  }(window.jQuery);

  !function($){
    $( ".welcome-h1")
  }
/////////////////////////////////////////////////////////////////

  function scrollToAnchor(aid){
    var aTag = $("a[name='"+ aid +"']");
    
    $('html,body').animate({scrollTop: aTag.offset().top},'slow');
}

$("#anchor-link-1").click(function() {
   scrollToAnchor('anchor-1');
});
  });

///////// NavBar ///////////

  $(document).ready(function(){
    $("#mobile_nav").click(function(){
      
      //toggles nav and ensures other elements play nice too
      if($("#primary_nav").css('left') < "0px"){
        $("#primary_nav").animate({left: "0px"}, 200);
        $("#wrapper_main_content").animate({left: "150px"}, 200);
        $("#wrapper_main_content").css("overflow-y","hidden");
        $("body").css("overflow-x","hidden");
        $("#primary_nav").css("overflow-y","hidden");
      }else{
        $("#primary_nav").animate({left: "-116px"}, 200);
        $("#wrapper_main_content").animate({left: "0px"}, 200);
        $("#wrapper_main_content").css("overflow-y","hidden");
        $("body").css("overflow-x","hidden");
        
      }
  
    });
     
  });//end

  