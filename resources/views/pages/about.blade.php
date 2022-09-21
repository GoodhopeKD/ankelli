<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="Learn more about Ankelli." />

    <title>About Us - Ankelli</title>

    <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous"> -->
    <link rel="stylesheet" href="https://cdn-emu.local/bootstrap-5.2.0-dist/css/bootstrap.min.css" >
    <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/fontawesome.min.css" integrity="sha512-P9vJUXK+LyvAzj8otTOKzdfF1F3UYVl13+F8Fof8/2QNb8Twd6Vb+VD52I7+87tex9UXxnzPgWA3rH96RExA7A==" crossorigin="anonymous" referrerpolicy="no-referrer" /> -->
    <!-- <link rel="stylesheet" href="https://cdn-emu.local/fontawesome-free-5.15.4-web/css/fontawesome.min.css" > -->
    <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/solid.min.css" integrity="sha512-tk4nGrLxft4l30r9ETuejLU0a3d7LwMzj0eXjzc16JQj+5U1IeVoCuGLObRDc3+eQMUcEQY1RIDPGvuA7SNQ2w==" crossorigin="anonymous" referrerpolicy="no-referrer" /> -->
    <!-- <link rel="stylesheet" href="https://cdn-emu.local/fontawesome-free-5.15.4-web/css/solid.min.css" > -->
    <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/brands.min.css" integrity="sha512-tk4nGrLxft4l30r9ETuejLU0a3d7LwMzj0eXjzc16JQj+5U1IeVoCuGLObRDc3+eQMUcEQY1RIDPGvuA7SNQ2w==" crossorigin="anonymous" referrerpolicy="no-referrer" /> -->
    <!-- <link rel="stylesheet" href="https://cdn-emu.local/fontawesome-free-5.15.4-web/css/brands.min.css" >  -->
    <link rel="stylesheet" href="{{ asset('css/app.css') }}">

    <link rel="icon" href="{{ asset('images/logo.jpeg') }}" />
    <link rel="apple-touch-icon" href="{{ asset('images/logo.jpeg') }}" />
    <meta name="application-name"         content="Ankelli" />
    <meta name="msapplication-TileColor"  content="#f8f9fa" />
    <meta name="msapplication-TileImage"  content="{{ asset('images/logo.jpeg') }}" />
    <meta property="og:type"              content="website" />
    <meta property="og:site_name"         content="Ankelli" />
    <meta property="og:url"               content="{{ config('app.url', 'https://ankelli.com') }}/terms-of-service" />
    <meta property="og:title"             content="About Us - Ankelli" />
    <meta property="og:description"       content="Learn more about Ankelli." />
    <meta property="og:image"             content="{{ asset('images/logo.jpeg') }}" />
    <meta property="og:image:alt"         content="Ankelli logo" />
    <meta name="twitter:card"             content="summary" />
    <meta name="twitter:url"              content="{{ config('app.url', 'https://ankelli.com') }}/terms-of-service" />
    <meta name="twitter:title"            content="About Us - Ankelli" />
    <meta name="twitter:description"      content="Learn more about Ankelli." />
    <meta name="twitter:image"            content="{{ asset('images/logo.jpeg') }}" />

  </head>
  <body>
    <div id="app_root"></div>

    <!--
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn-emu.local/jquery-3.6.0.min.js" ></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn-emu.local/popper-js/1.16.1/popper.min.js" ></script>
    -->

    <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script> -->
    <script src="https://cdn-emu.local/bootstrap-5.2.0-dist/js/bootstrap.bundle.min.js" ></script>
    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/fontawesome.min.js" integrity="sha512-ywaT8M9b+VnJ+jNG14UgRaKg+gf8yVBisU2ce+YJrlWwZa9BaZAE5GK5Yd7CBcP6UXoAnziRQl40/u/qwVZi4Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script> -->
    <!-- <script src="https://cdn-emu.local/fontawesome-free-5.15.4-web/js/fontawesome.min.js" ></script> -->
    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/solid.min.js" integrity="sha512-+KCv9G3MmyWnFnFrd2+/ccSx5ejo1yED85HZOvNDhtyHu2tuLL8df5BtaLXqsiF68wGLgxxMb4yL5oUyXjqSgw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script> -->
    <!-- <script src="https://cdn-emu.local/fontawesome-free-5.15.4-web/js/solid.min.js" ></script> -->
    <script src="{{ asset('js/app.js') }}" ></script>

  </body>
</html>
