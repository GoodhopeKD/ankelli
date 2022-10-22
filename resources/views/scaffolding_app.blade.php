<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}" class="h-100">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="Welcome to the Ankelli Platform" />
    <title>Ankelli</title>
  @if(env('APP_ENV') == 'local')
  <link rel="stylesheet" href="https://cdn-emu.local/bootstrap-5.2.0-dist/css/bootstrap.min.css" >
  <!--<link rel="stylesheet" href="https://cdn-emu.local/fontawesome-free-5.15.4-web/css/all.min.css" crossorigin="anonymous" referrerpolicy="no-referrer" >-->
  <!--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />-->
  @else
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
  @endif
  <link rel="stylesheet" href="{{ asset('css/app.css') }}">
    <link rel="icon" href="{{ asset('images/logo.jpeg') }}" />
    <link rel="apple-touch-icon" href="{{ asset('images/logo.jpeg') }}" />
    <meta name="app-api-url" id="app-api-url" content="{{ env('APP_API_URL') }}" />
    <meta name="test" content="{{ env('TEST_VAR') }}" />
    <meta name="application-name"         content="Ankelli" />
    <meta name="msapplication-TileColor"  content="#f8f9fa" />
    <meta name="msapplication-TileImage"  content="{{ asset('images/logo.jpeg') }}" />
    <meta property="og:type"              content="website" />
    <meta property="og:site_name"         content="Ankelli" />
    <meta property="og:url"               content="{{ config('app.url') }}" />
    <meta property="og:title"             content="Ankelli" />
    <meta property="og:description"       content="Welcome to the Ankelli Platform" />
    <meta property="og:image"             content="{{ asset('images/logo.jpeg') }}" />
    <meta property="og:image:alt"         content="Ankelli logo" />
    <meta name="twitter:card"             content="summary" />
    <meta name="twitter:url"              content="{{ config('app.url') }}" />
    <meta name="twitter:title"            content="Ankelli" />
    <meta name="twitter:description"      content="Welcome to the Ankelli Platform" />
    <meta name="twitter:image"            content="{{ asset('images/logo.jpeg') }}" />
  </head>
  <body class="h-100">

    <div id="app_root" class="h-100 d-flex flex-column">
<?php $scaffolding_app_enabled_pref_item = App\Models\_PrefItem::firstWhere('key_slug', 'scaffolding_app_enabled');
if ($scaffolding_app_enabled_pref_item && !$scaffolding_app_enabled_pref_item->value){ ?>
      <div class="container-fluid p-3">
        <p>The Ankelli App is undergoing maintenance. Please check again in a short while.</p>
        <h5>Available links</h5>
        <ul>
          <li><a href='/about' >About</a></li>
          <li><a href='/contact' >Contact</a></li>
          <li><a href='/faq' >Requently Asked Questions</a></li>
          <li><a href='/privacy-policy' >Privacy policy</a></li>
          <li><a href='/terms-of-service' >Terms of Service</a></li>
        </ul>
      </div>
<?php } ?>
    </div>

    <script>
      window.sysconfig_params_data = <?php echo json_encode((new App\Http\Controllers\API\__AuxController)->sysconfig_params()->getData()->data); ?> 
      window.datalists_data = <?php echo json_encode((new App\Http\Controllers\API\__AuxController)->datalists()->getData()); ?> 
    </script>
  @if(env('APP_ENV') == 'local')
  <script src="https://cdn-emu.local/bootstrap-5.2.0-dist/js/bootstrap.bundle.min.js" ></script>
  @else
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
  @endif
<?php $scaffolding_app_enabled_pref_item = App\Models\_PrefItem::firstWhere('key_slug', 'scaffolding_app_enabled');
if ($scaffolding_app_enabled_pref_item && $scaffolding_app_enabled_pref_item->value_f()){ ?>
  <script src="{{ asset('js/app.js') }}" ></script>
<?php } ?>

  </body>
</html>
