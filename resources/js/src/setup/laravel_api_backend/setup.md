# Instructions for creating Laravel App with React Scaffolding
### Particularly for the Ankelli App


## Creating the app

Create the app then give permission to modify directory

```properties
laravel new ankelli
sudo chmod -R 777 /Applications/XAMPP/xamppfiles/htdocs/
cd ankelli
```

## Setting up the database

Create the database in phpmyadmin then add the name, user and password to the .env file

Create the models with their migration files

Change User to _User (__User) accross all files,

```properties
php artisan make:model _AdminExtension -m
php artisan make:model _BuyerExtension -m
php artisan make:model _SellerExtension -m

php artisan make:model _UserGroup -m
php artisan make:model _UserGroupMembership -m
php artisan make:model _Permission -m
php artisan make:model _PermissionInstance -m

php artisan make:model _Session -m
php artisan make:model _Notification -m
php artisan make:model _PrefItem -m
php artisan make:model _RegToken -m
php artisan make:model _VerifToken -m

php artisan make:model _EmailAddress -m
php artisan make:model _PhoneNo -m
php artisan make:model _File -m

php artisan make:model _FeedbackReport -m
php artisan make:model _Post -m

php artisan make:model _Asset -m
php artisan make:model _AssetAccount -m
php artisan make:model _AssetAccountAddress -m
php artisan make:model _Currency -m
php artisan make:model _PymtMethod -m
php artisan make:model _Country -m
php artisan make:model _Exportable -m

php artisan make:model _DepositToken -m
php artisan make:model _Offer -m
php artisan make:model _Trade -m
php artisan make:model _Chat -m
php artisan make:model _Message -m
php artisan make:model _Pinning -m
php artisan make:model _Transaction -m

php artisan make:model _Log -m

```

Write all columns inside migrations in **`database/migrations/*`**

Add the migrations

```properties
php artisan migrate
```

Remove factory from all models

_User should extend Authenticatable and not Model

We're handling soft deletes manually so no need to set that up

Edit datetime casts and fillables for all models

Edit relations for all models

## Controllers and Resources


In the **`app/Providers/RouteServiceProvider`** file

- Uncomment or add line if it doesn't exist
```php
	/**
     * The controller namespace for the application.
     *
     * When present, controller route declarations will automatically be prefixed with this namespace.
     *
     * @var string|null
     */
    protected $namespace = 'App\\Http\\Controllers';
```

- Add api_location in boot method to cater for api subdomain, then setup the subdomain in the **`.env`** file
```php
	public function boot()
    {
        $this->configureRateLimiting();

        $this->routes(function () {
            $api_location = env('MIX_API_URL') ? Route::domain(env('MIX_API_URL')) : Route::prefix('api');
            $api_location
                ->middleware('api')
                ->namespace($this->namespace . '\\API')
                ->group(base_path('routes/api.php'));

            Route::middleware('web')
                ->group(base_path('routes/web.php'));
        });
    }
```

Create and modify the controllers

```properties
php artisan make:controller API/__AuxController
php artisan make:controller API/__TatumAPIController

php artisan make:controller API/_UserController --api
php artisan make:controller API/_SessionController --api
php artisan make:controller API/_EmailAddressController --api
php artisan make:controller API/_PrefItemController --api
php artisan make:controller API/_NotificationController --api
php artisan make:controller API/_VerifTokenController --api
php artisan make:controller API/_RegTokenController --api

php artisan make:controller API/_PhoneNoController --api
php artisan make:controller API/_FileController --api
php artisan make:controller API/_LogController --api
php artisan make:controller API/_MessageController --api

php artisan make:controller API/_AssetController --api
php artisan make:controller API/_CurrencyController --api
php artisan make:controller API/_PymtMethodController --api
php artisan make:controller API/_CityController --api
php artisan make:controller API/_CountryController --api

php artisan make:controller API/_UserGroupController --api
php artisan make:controller API/_UserGroupMembershipController --api
php artisan make:controller API/_PermissionController --api
php artisan make:controller API/_PermissionInstanceController --api
php artisan make:controller API/_ExportableController --api

php artisan make:controller API/_AssetAccountController --api
php artisan make:controller API/_AssetAccountAddressController --api
php artisan make:controller API/_ChatController --api
php artisan make:controller API/_DepositTokenController --api
php artisan make:controller API/_FeedbackReportController --api
php artisan make:controller API/_OfferController --api
php artisan make:controller API/_PinningController --api
php artisan make:controller API/_PostController --api
php artisan make:controller API/_TradeController --api
php artisan make:controller API/_TransactionController --api

php artisan make:controller API/_AdminExtensionController --api
php artisan make:controller API/_BuyerExtensionController --api
php artisan make:controller API/_SellerExtensionController --api

```
Create and modify the Resources

```properties
php artisan make:resource _UserResource
php artisan make:resource _UserResourceCollection --collection
php artisan make:resource _SessionResource
php artisan make:resource _EmailAddressResource
php artisan make:resource _EmailAddressResourceCollection --collection
php artisan make:resource _PrefItemResource
php artisan make:resource _PrefItemResourceCollection --collection
php artisan make:resource _NotificationResource
php artisan make:resource _VerifTokenResource
php artisan make:resource _RegTokenResource

php artisan make:resource _PhoneNoResource
php artisan make:resource _PhoneNoResourceCollection --collection
php artisan make:resource _FileResource
php artisan make:resource _FileResourceCollection --collection
php artisan make:resource _LogResource
php artisan make:resource _MessageResource
php artisan make:resource _MessageResourceCollection --collection

php artisan make:resource _AssetResource
php artisan make:resource _AssetResourceCollection --collection
php artisan make:resource _CurrencyResource
php artisan make:resource _CurrencyResourceCollection --collection
php artisan make:resource _PymtMethodResource
php artisan make:resource _PymtMethodResourceCollection --collection
php artisan make:resource _CityResource
php artisan make:resource _CityResourceCollection --collection
php artisan make:resource _CountryResource
php artisan make:resource _CountryResourceCollection --collection

php artisan make:resource _UserGroupResource
php artisan make:resource _UserGroupResourceCollection --collection
php artisan make:resource _UserGroupMembershipResource
php artisan make:resource _UserGroupMembershipResourceCollection --collection
php artisan make:resource _PermissionResource
php artisan make:resource _PermissionResourceCollection --collection
php artisan make:resource _PermissionInstanceResource
php artisan make:resource _PermissionInstanceResourceCollection --collection
php artisan make:resource _ExportableResource
php artisan make:resource _ExportableResourceCollection --collection

php artisan make:resource _AssetAccountResource
php artisan make:resource _AssetAccountResourceCollection --collection
php artisan make:resource _AssetAccountAddressResource
php artisan make:resource _AssetAccountAddressResourceCollection --collection
php artisan make:resource _ChatResource
php artisan make:resource _ChatResourceCollection --collection
php artisan make:resource _DepositTokenResource
php artisan make:resource _DepositTokenResourceCollection --collection
php artisan make:resource _FeedbackReportResource
php artisan make:resource _FeedbackReportResourceCollection --collection
php artisan make:resource _OfferResource
php artisan make:resource _OfferResourceCollection --collection
php artisan make:resource _PinningResource
php artisan make:resource _PinningResourceCollection --collection
php artisan make:resource _PostResource
php artisan make:resource _PostResourceCollection --collection
php artisan make:resource _TradeResource
php artisan make:resource _TradeResourceCollection --collection
php artisan make:resource _TransactionResource
php artisan make:resource _TransactionResourceCollection --collection

php artisan make:resource _AdminExtensionResource
php artisan make:resource _AdminExtensionResourceCollection --collection
php artisan make:resource _BuyerExtensionResource
php artisan make:resource _BuyerExtensionResourceCollection --collection
php artisan make:resource _SellerExtensionResource
php artisan make:resource _SellerExtensionResourceCollection --collection

```

## API Authentication Setup

```properties
composer require laravel/passport
```

add to **`config/app.php`** after the App\Providers\

```php
Laravel\Passport\PassportServiceProvider::class, 
```

To add oauth tables, and create secret key run commands

```properties
php artisan migrate
php artisan passport:install
```

In the _User Model, add after namespace

```php
use Laravel\Passport\HasApiTokens;
```

Then add in class 

```php
use HasApiToken
```

In the **`app/Providers/AuthServiceProvider`** file

- Add after other includes on top
```php
use Laravel\Passport\Passport; 
```

- In `$policies`, uncomment 

```php
'App\Models\Model' => 'App\Policies\ModelPolicy'
```

- In the `boot()` function, add after `registerPolicies()`

```php
if (! $this->app->routesAreCached()) {
	Passport::routes();
}
```

In the **`config/auth.php`** file

- In `guards`:
	- Change api driver to passport 
```php
    'guards' => [
        'web' => [
            'driver' => 'session',
            'provider' => 'users',
        ],
        'api' => [
            'driver' => 'passport',
            'provider' => 'users',
        ],
    ],
```


## Location Setup

Run command
```properties
composer require stevebauman/location
```

In the **`config/app.php`** file

- Add after passport:

```php
Stevebauman\Location\LocationServiceProvider::class
```

Then run

```properties
php artisan vendor:publish --provider="Stevebauman\Location\LocationServiceProvider"
```

Configure the **`config/location.php`** file

## Middlware Setup

```properties
php artisan make:middleware EnsureSessionTokenIsValid
```

Add to the **`app/HTTP/Kernel.php`** in the `api` section

```php
\App\Http\Middleware\EnsureSessionTokenIsValid::class,
```

## Session setup

Add to the **`app/HTTP/Kernel.php`** in the `api` section

```php
\App\Http\Middleware\EncryptCookies::class,
\Illuminate\Session\Middleware\StartSession::class,
```

## CORS setup

Run command
```properties
composer require fruitcake/laravel-cors
```

Add the following to **`app/HTTP/Kernel.php`** in the `$middleware` section

```php
\Fruitcake\Cors\HandleCors::class,
```

Run command
```properties
php artisan vendor:publish --tag="cors"
```

Edit the **`config/cors.php`** file

Run command
```properties
php artisan config:cache
```

### Folders to copy in refresh

/app
/config
/database
/public
/resources
/storage

### Items to upload to webhost

/app
/bootstrap
/config
/lang
/public (run prod using .env.platform)
/resources
/routes
/storage
/vendor
/.env (use .env.platform)