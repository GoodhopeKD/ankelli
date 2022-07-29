## Setting up stage for standalone React frontend (laravel api consumer)

```properties
npx create-react-native-app Ankelli
cd Ankelli
yarn
```

Copy **`src`** folder to the app's root directory

Modify `App` import in file **`index.js`** to look like this
```js
import { registerRootComponent } from 'expo';

import App from './src/app/views/AppContainer';

// registerRootComponent calls AppRegistry.registerComponent('main', () => App);
// It also ensures that whether you load the app in Expo Go or in a native build,
// the environment is set up appropriately
registerRootComponent(App);
```

Create file **`tsconfig.json`** if it doesn't exist and make sure it has the following options
```json
{
    "compilerOptions": {
        "esModuleInterop": true,
        "jsx": "react-native",
        "baseUrl": "src"
    },
}
```

Create file **`src/app/package.json`** with the following contents
```json
{"name": "app"}
```

Create file **`react-native.config.js`** if it doesn't exist and add:

```js
module.exports={
    assets:[
        "./src/setup/react_native_app/fonts"
    ]
}
```

Link assets then clear duplicate copied assets
```properties
yarn react-native link
rm -R android/app/src/main/assets/fonts
```

Edit **`package.json`** to add the following under script:
```json
"android-create-debug-app": "sudo mkdir -p android/app/src/main/assets/ && sudo react-native bundle --platform android --minify --dev false --entry-file index.js --bundle-output android/app/src/main/assets/index.android.bundle --assets-dest android/app/src/main/res && cd android && ./gradlew assembleDebug && cd .. && mv android/app/build/outputs/apk/debug/app-debug.apk app-debug.apk"
```

Edit **`android/app/build.gradle`**
replace
```gradle
def jscFlavor = 'org.webkit:android-jsc:+'
```
with
```gradle
def jscFlavor = 'org.webkit:android-jsc-intl:+'
```

## For Expo Image Picker

Edit **`ios/Ankelli/info.plist`** to add
```plist
<key>NSPhotoLibraryUsageDescription</key>
<string>Give $(PRODUCT_NAME) permission to save photos</string>
<key>NSCameraUsageDescription</key>
<string>Give $(PRODUCT_NAME) permission to access your camera</string>
<key>NSMicrophone_numberUsageDescription</key>
<string>Give $(PRODUCT_NAME) permission to use your microphone_number</string>
```

Edit **`android/app/src/main/AndroidManifest.xml`** to add permissions
```xml
<!-- Added permissions -->
<uses-permission android:name="android.permission.CAMERA" />
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
```
Edit **`android/app/src/main/AndroidManifest.xml`** to add activity
```xml
<activity
  android:name="com.theartofdev.edmodo.cropper.CropImageActivity"
  android:theme="@style/Base.Theme.AppCompat">
</activity>
```

## Run automated Icon Copy
```properties
sudo chmod +x src/setup/react_native_app/copy_assets.sh
./src/setup/react_native_app/copy_assets.sh
```

Install packages
```properties
expo install typescript moment axios react-native-bg-thread @react-native-community/netinfo expo-device redux @reduxjs/toolkit react-redux redux-thunk redux-persist @react-native-async-storage/async-storage firebase react-redux-firebase redux-firestore @react-navigation/native react-native-reanimated react-native-gesture-handler react-native-screens react-native-safe-area-context @react-navigation/stack @react-navigation/material-bottom-tabs react-native-paper react-native-vector-icons @react-navigation/material-top-tabs react-native-tab-view react-native-pager-view react-native-elements @protonapp/react-native-material-ui react-native-material-menu expo-image-picker react-native-raw-bottom-sheet react-native-image-slider-box react-native-counters react-native-date-picker
```

Compile the code using the following

```properties
npm android
```

