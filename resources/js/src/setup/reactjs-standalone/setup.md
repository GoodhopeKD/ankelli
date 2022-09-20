## Setting up stage for standalone React frontend (laravel api consumer)

```properties
npx create-react-app Ankelli
cd Ankelli
npm install
```

Copy **`src`** folder to the app's root directory

Modify file **`src/index.js`** to look like this
```js
import React from 'react'
import ReactDOM from 'react-dom/client'

import { AppContainer } from 'app/views'

const root = ReactDOM.createRoot(document.getElementById('root'))
root.render(
    <React.Fragment>
        <AppContainer />
    </React.Fragment>
)
```

Create file **`tsconfig.json`** if it doesn't exist and make sure it has the following options
```json
{
    "compilerOptions": {
        "esModuleInterop": true,
        "jsx": "react",
        "baseUrl": "src"
    },
}
```

Install packages
```properties
npm i axios moment @reduxjs/toolkit react-redux redux-persist jquery@3.6.0 bootstrap@4.6.1
```

- **`popper.js`** // not installed unless necessary
- **`@fortawesome/fontawesome-free@5.15.4`** // Using CDN links

Compile the code using the following

```properties
npm start
```

