# Cordova Example

This project build an example cordova IOS project currently

##Contents
The project uses npm it manage the lifecycle of the application;

- Cordova plugins are versioned in the package.json
- Platforms are specified in the packages.json
- All normal node dependencies are available in the package.json

# Usage

##Building and testing localy

In order to install we can run 2 simple commands;
- npm install
- npm simulate:ios

## Creating an IPA

There are 2 additional environment variables that need to be set to build an IPA
for release

- CODE_SIGNING_IDENTITY - this should be set to the name of the key in your keychain eg. ```iPhone Developer: Your Name```
- PROVISIONING_PROFILE - this is the file path of the provisioning profile that will be used
- VERSION - this can be set to change the filename of the IPA, it defaults to dev 

Once you have these you can then run;
```
CODE_SIGNING_IDENTITY="Your identity" PROVISIONING_PROFILE="/tmp/profile" npm run release:ios 
```

This will generate an ipa file at **target/workshop-<VERSION>.api**

### Supported commands

Each of the following commands can be run with npm run <command>

- cordova:plugins - installs all plugins that you have in your package
- cordova:platforms - setup platforms specified in your package
- build:ios - Runs the cordova setup and then builds the xcode project
- release:ios - Runs the build and then runs a script to generate an ipa
- simulate:ios - Builds the xcode project and starts the simulator with that project
- clean - Removed all generated modules and files
