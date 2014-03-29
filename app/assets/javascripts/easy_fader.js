// $(document).ready(function() {
//   function easyFader($container, slideDur, fadeDur){

//     // Add empty config object to DOM object of container
//     $container[0].faderConfig = {};

//     // Declare private vars. These will be used to store data that isn't user defined
//     var slideSelector = '.slide', // selector for target elements
//         slideTimer, // will contain our setTimeout function
//         totalSlides, // total number of slides
//         activeSlide, // index of active slide
//         $slides = $container.find(slideSelector); // jQuery obj containing all the slides          
//         totalSlides = $slides.length; // Find the total number of slides
//         var config = $container[0].faderConfig; // Cache object as a local variable  

//     // Assign public properties to the config object
//     config = {
//         slideDur : slideDur,
//         fadeDur : fadeDur
//     }    

//     // Show the first slide using jQuery's eq() method
//     $slides.eq(0).css('opacity',1);

//     // Our first slide is now active, so let's set our activeSlide variable to 0
//     activeSlide = 0;

//     // Start the timer
//     slideTimer = setTimeout(function(){
//        changeSlides('next');
//     }, config.slideDur);        

//     function changeSlides(target){

//     // Build a conditional framework to handle our three possible options
//     if(target == 'next'){

//       // Target the next slide
//       newSlide = activeSlide + 1;

//       // Check if we're at the end of the stack, and if so, loop back to the start
//       if(newSlide > totalSlides -1){
//         newSlide = 0;
//       }
//     } else if(target == 'prev'){

//       //Target the previous slide
//       newSlide = activeSlide - 1;

//       // Check if we're at the end of the stack, and if so, loop back to the end
//       if(newSlide < 0){
//         newSlide = totalSlides - 1;
//       };
//     } else {

//       // If not next or prev, target must be an integer, so target is newSlide
//       newSlide = target;
//     };

//     animateSlides(activeSlide, newSlide);

//   };

//   function animateSlides(activeNdx, newNdx){

//     // Move the active slide up to z-index 3
//     $slides.eq(activeNdx).css('z-index', 3);

//     // Move the new slide to just below it at z-index 2 and set its opacity to 1
//     $slides.eq(newNdx).css({
//       'z-index': 2,
//       'opacity': 1
//     });

//     // Let's go ahead with jQuery .animate() for now and fade the current slide to 
//     // reveal new slide beneath
//     $slides.eq(activeNdx).animate({'opacity': 0}, config.fadeDur, function(){

//       // Remove all inline styles from element
//       $slides.eq(activeNdx).removeAttr('style');

//       // New slide becomes active slide
//       activeSlide = newNdx;

//       // Start timer
//       waitforNext();

//     });

//   };

//   function waitforNext(){
//     slideTimere = setTimeout(function(){
//       changeSlides('next');
//     },config.slideDur);
//   };
//   };

  


// });