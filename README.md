# GGEZ
Proxecto DAW

+ versión 0.1 lanzada! yay

Mapa de clases e funcionamento da aplicación.
Sendo unha versión moi básica, por agora so realiza querys á API de Twitch, recibe os datos e mostraos sin maquetar. Precioso.
A próxima implementación tentarei que sexa o almacenamento das querys en cache para axilizar os tempos de busca, e seguirán os rexistros de usuarios e os acesos á base de datos local.

1. Vistas | resources/views

A vista  plantilla.blade.php sirve como base. Mostra un menú de navegación en cada vista que extende dela, almacenado na plantilla /partials/nav.blade.php

A partir deste menú podemos acceder a varias opcións. Básicamente son enlaces de proba, testeo ós que non debemos prestar atención por agora, ademáis de un xestor de contactos básico que envía emails das mesaxes a Mailtrap.

Si clickamos un destes enlaces o recorrido será o seguinte:

  + chama á ruta que corresponda co nome indicado, pex. route('contacto'). As rutas almacénanse en web.php
  + dende web.php chama ao controlador (de existir) que se encarga dese enlace, pex. <code>Route::post('contacto', 'MensajesController@store')->name('contacto');</code> Os controladores están en app/Http/Controllers
  + O controlador será un arquivo php onde programaremos o comportamento dese enlace. Podemos crealo cos métodos que mías nos interesen, segundo á sua función.
  Polo xeral, o controlador devolve unha vista que procesará os datos recibidos, de habelos.
  
    Resumindo, enlace de nav.php > controlador do enlace > vista a mostrar.
    
 2. Controladores | app/Http/Controllers
 
  O código máis interesante agora mesmo é o dos controladores que manexan a busca na bbdd.
  Dende o formulario de busca presente en nav se envía unha petición POST ao controlador SearchController, que buscará na bbdd slugs similares ao texto introducido:
        
        <code>Route::post('/busqueda', 'SearchController')->name('search');</code>
        
      este controlador devolve varios datos á vista queryResults.blade.php. Nesta vista os datos mostraranse seguindo unha plantilla básica de html.
      
      >> O código máis interesante:
        - Rutas (routes/app): web.php
        - Controladores (app/Http/Controllers): SearchController.php e GamePageController.php, e en menor medida MensajesController
        - Vistas (resources/views): querys/queryResults.blade.php e querys/gamepage.blade.php, e en menor medida nav.blade.php e emails/MensajeRecibido.blade.php
        - arquivo helper.php que conten un par de métodos recurrentes (e almacenará outros nun futuro)
        
  Nas querys á base de datos se emprega o wrapper para Laravel igdb-laravel: https://github.com/marcreichel/igdb-laravel 
      




