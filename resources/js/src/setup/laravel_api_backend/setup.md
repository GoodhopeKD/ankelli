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
php artisan make:model _Session -m
php artisan make:model _EmailAddress -m
php artisan make:model _PreferenceItem -m
php artisan make:model _Notification -m
php artisan make:model _VerificationToken -m
php artisan make:model _RegistrationToken -m

php artisan make:model _PhoneNumber -m
php artisan make:model _File -m
php artisan make:model _Log -m
php artisan make:model _Message -m

php artisan make:model _Asset -m
php artisan make:model _Currency -m
php artisan make:model _PaymentMethod -m
php artisan make:model _City -m
php artisan make:model _Province -m

php artisan make:model _UserGroup -m
php artisan make:model _UserGroupMembership -m
php artisan make:model _Permission -m
php artisan make:model _PermissionInstance -m
php artisan make:model _Exportable -m

php artisan make:model _AssetAccount -m
php artisan make:model _Chat -m
php artisan make:model _DepositToken -m
php artisan make:model _FeedbackReport -m
php artisan make:model _Offer -m
php artisan make:model _Pinning -m
php artisan make:model _Post -m
php artisan make:model _Trade -m
php artisan make:model _Transaction -m

php artisan make:model _AdminExtension -m
php artisan make:model _BuyerExtension -m
php artisan make:model _SellerExtension -m

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
            $api_location = env('API_SUBDOMAIN') ? Route::domain(env('API_SUBDOMAIN')) : Route::prefix('api');
            $api_location
                ->middleware('api')
                ->namespace($this->namespace)
                ->group(base_path('routes/api.php'));

            Route::middleware('web')
                ->namespace($this->namespace)
                ->group(base_path('routes/web.php'));
        });
    }
```

Create and modify the controllers

```properties
php artisan make:controller API/_DiscountInstanceController --api
php artisan make:controller API/_LogController --api
php artisan make:controller API/_NotificationController --api
php artisan make:controller API/_SessionController --api
php artisan make:controller API/_UserGroupMembershipController --api
php artisan make:controller API/_VerificationTokenController --api

php artisan make:controller API/_AddressController --api
php artisan make:controller API/_EmailAddressController --api
php artisan make:controller API/_FileController --api
php artisan make:controller API/_LinkController --api
php artisan make:controller API/_PhoneNumberController --api
php artisan make:controller API/_PreferenceItemController --api

php artisan make:controller API/_DiscountCodeController --api
php artisan make:controller API/_EventController --api
php artisan make:controller API/_FeedbackReportController --api
php artisan make:controller API/_ListingController --api
php artisan make:controller API/_OrderController --api
php artisan make:controller API/_PinningController --api

php artisan make:controller API/_CityController --api
php artisan make:controller API/_ListingCategoryController --api

php artisan make:controller API/_UserGroupController --api

php artisan make:controller API/_AdminExtensionController --api
php artisan make:controller API/_ApplicantExtensionController --api
php artisan make:controller API/_TraderExtensionController --api
php artisan make:controller API/_StoreController --api
php artisan make:controller API/_UserController --api

```
Create and modify the Resources

```properties
php artisan make:resource _DiscountInstanceResource
php artisan make:resource _DiscountInstanceResourceCollection --collection
php artisan make:resource _LogResource
php artisan make:resource _NotificationResource
php artisan make:resource _SessionResource
php artisan make:resource _UserGroupMembershipResource
php artisan make:resource _UserGroupMembershipResourceCollection --collection
php artisan make:resource _VerificationTokenResource

php artisan make:resource _AddressResource
php artisan make:resource _AddressResourceCollection --collection
php artisan make:resource _EmailAddressResource
php artisan make:resource _EmailAddressResourceCollection --collection
php artisan make:resource _FileResource
php artisan make:resource _FileResourceCollection --collection
php artisan make:resource _LinkResource
php artisan make:resource _LinkResourceCollection --collection
php artisan make:resource _PhoneNumberResource
php artisan make:resource _PhoneNumberResourceCollection --collection
php artisan make:resource _PreferenceItemResource
php artisan make:resource _PreferenceItemResourceCollection --collection

php artisan make:resource _DiscountCodeResource
php artisan make:resource _DiscountCodeResourceCollection --collection
php artisan make:resource _EventResource
php artisan make:resource _EventResourceCollection --collection
php artisan make:resource _FeedbackReportResource
php artisan make:resource _FeedbackReportResourceCollection --collection
php artisan make:resource _ListingResource
php artisan make:resource _ListingResourceCollection --collection
php artisan make:resource _OrderResource
php artisan make:resource _OrderResourceCollection --collection
php artisan make:resource _PinningResource
php artisan make:resource _PinningResourceCollection --collection

php artisan make:resource __UserDisplayCardResource
php artisan make:resource __VisitViewFollowCountResource

php artisan make:resource _CityResource
php artisan make:resource _CityResourceCollection --collection
php artisan make:resource _ListingCategoryResource
php artisan make:resource _ListingCategoryResourceCollection --collection

php artisan make:resource _UserGroupResource
php artisan make:resource _UserGroupResourceCollection --collection

php artisan make:resource _AdminExtensionResource
php artisan make:resource _AdminExtensionResourceCollection --collection
php artisan make:resource _ApplicantExtensionResource
php artisan make:resource _ApplicantExtensionResourceCollection --collection
php artisan make:resource _TraderExtensionResource
php artisan make:resource _TraderExtensionResourceCollection --collection
php artisan make:resource _StoreResource
php artisan make:resource _StoreResourceCollection --collection
php artisan make:resource _UserResource
php artisan make:resource _UserResourceCollection --collection

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
php artisan make:middleware EnsureAppAccessTokenIsValid
```

Add to the **`app/HTTP/Kernel.php`** in the `api` section

```php
\App\Http\Middleware\EnsureAppAccessTokenIsValid::class,
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

### Hot Items

/app
/config
/database
/resources
/storage

/resources
/public