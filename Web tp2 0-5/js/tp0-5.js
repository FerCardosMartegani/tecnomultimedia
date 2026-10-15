/* colapsable de la izquierda */
  $(document).ready(function(){
    $('.collapsible').collapsible();
  });

  $(document).ready(function(){
    $('.sidenav').sidenav();
  });

  $(document).ready(function(){
    $('.fixed-action-btn').floatingActionButton();
  });

/* imagenes aumentables */
  $(document).ready(function(){
    $('.materialboxed').materialbox();
  });

/* carrusel */
  $('.carousel.carousel-slider').carousel({
    fullWidth: true,
    indicators: true
  });

/* cartelitos de hover */
  $(document).ready(function(){
    $('.tooltipped').tooltip();
  });