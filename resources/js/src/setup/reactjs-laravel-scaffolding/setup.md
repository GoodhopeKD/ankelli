## Setting up stage for React scaffolding

```properties
composer require laravel/ui
php artisan ui react
npm install
```

In file **`routes/web.php`**, replace the welcome route with the following

```php
// Hand over control to react at entry point views/app.blade.php
Route::view('/{path?}', 'app')
	->where('path', '.*')
	->name('react');
```

Copy **`src`** folder to **`resources/js/`** directory

Modify file **`resources/js/src/index.js`** to look like this
```js
import React from 'react'
import ReactDOM from 'react-dom';

import { AppContainer } from 'app/views'

ReactDOM.render(
    <React.Fragment>
        <AppContainer />
    </React.Fragment>,
    document.getElementById('root')
);
```

Create file **`tsconfig.json`** if it doesn't exist and make sure it has the following options
```json
{
    "compilerOptions": {
        "esModuleInterop": true,
        "jsx": "react",
        "allowJs": true,
        "target": "es5",
        "baseUrl": "resources/js/src",
    },
}
```

In file **`webpack.mix.js`**

- Add
```js
mix.webpackConfig({
    resolve: {
        extensions: [".js", '.ts', ".jsx"],
        alias: {
            "app": __dirname + "/resources/js/src/app"
        }
    }
});
```

In file **`resources/js/app.js`** ensure 
```js
require('./src/index.js');
```

In file **`resources/js/bootstrap.js`** add
```js
try {
  window.$ = window.jQuery = require("jquery");
  //window.Popper = require("popper.js").default; //if required
  require("bootstrap");
} catch (e) { }
```

- Change mix.js to mix.ts

Install packages
```properties
npm i react-router-dom axios moment @reduxjs/toolkit react-redux redux-persist jquery bootstrap
```

- **`popper.js`** // not installed unless necessary
- **`@fortawesome/fontawesome-free@5.15.4`** // Using CDN links

Compile the code using any one of the following

```properties
npm run watch
npm run dev
npm run prod
```

