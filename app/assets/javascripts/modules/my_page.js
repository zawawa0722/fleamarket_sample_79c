$('.flip').mouseenter(function()
{ 
  $(this).find('.card').addClass('flipped').mouseleave(function()
      {
        $(this).removeClass('flipped');
      });
    
  return false;
});