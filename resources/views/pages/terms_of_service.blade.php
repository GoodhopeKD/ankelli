<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="Read the Ankelli Terms of Service" />

    <title>Terms of Service - Ankelli</title>

    <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous"> -->
    <link rel="stylesheet" href="https://cdn-emu.local/bootstrap-5.2.0-dist/css/bootstrap.min.css" >
    <link rel="stylesheet" href="{{ asset('css/app.css') }}">

    <link rel="icon" href="{{ asset('images/logo.jpeg') }}" />
    <link rel="apple-touch-icon" href="{{ asset('images/logo.jpeg') }}" />
    <meta name="application-name"         content="Ankelli" />
    <meta name="msapplication-TileColor"  content="#f8f9fa" />
    <meta name="msapplication-TileImage"  content="{{ asset('images/logo.jpeg') }}" />
    <meta property="og:type"              content="website" />
    <meta property="og:site_name"         content="Ankelli" />
    <meta property="og:url"               content="{{ config('app.url', 'https://ankelli.com') }}/terms-of-service" />
    <meta property="og:title"             content="Terms of Service - Ankelli" />
    <meta property="og:description"       content="Read the Ankelli Terms of Service" />
    <meta property="og:image"             content="{{ asset('images/logo.jpeg') }}" />
    <meta property="og:image:alt"         content="Ankelli logo" />
    <meta name="twitter:card"             content="summary" />
    <meta name="twitter:url"              content="{{ config('app.url', 'https://ankelli.com') }}/terms-of-service" />
    <meta name="twitter:title"            content="Terms of Service - Ankelli" />
    <meta name="twitter:description"      content="Read the Ankelli Terms of Service" />
    <meta name="twitter:image"            content="{{ asset('images/logo.jpeg') }}" />

  </head>
  <body>
    <div id="app_root"></div>
    <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script> -->
    <script src="https://cdn-emu.local/bootstrap-5.2.0-dist/js/bootstrap.bundle.min.js" ></script>
    <script src="{{ asset('js/app.js') }}" ></script>

  </body>
</html>
