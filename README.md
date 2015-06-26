# Cordova Example

This project build an example cordova IOS project currently

# Usage

#Contents
The project uses npm it manage the lifecycle of the application;
- Cordova plugins are versioned in the package.json
- Platforms are specified in the packages.json
- All normal node dependencies are available in the package.json

##Building and testing localy

In order to install we can run 2 simple commands;
- npm install
- npm simulate:ios

## Creating an IPA

There are 2 additional environment variables that need to be set to build an IPA
for release

CODE_SIGNING_IDENTITY - this should be set to the name of the key in your keychain eg. '''iPhone Developer: Your Name'''
PROVISIONING_PROFILE - this is the file path of the provisioning profile that will be used
VERSION - this can be set to change the filename of the IPA, it defaults to workshope-<VERSION>.ipa 

Once you have these you can then run;
- CODE_SIGNING_IDENTITY="Your identity" PROVISIONING_PROFILE="/tmp/profile" npm run release:ios 

This will generate an ipa file in the target folder inside your project 
