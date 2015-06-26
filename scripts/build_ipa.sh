#!/bin/bash

CURRENT_PATH=$( cd $(dirname $0) ; pwd -P)

if [ -z "$CODE_SIGNING_IDENTITY" ]; then
        echo "No code signing identity specified, set CODE_SIGNING_IDENTITY to change"
fi

if [ -z "$PROVISIONING_PROFILE" ]; then
        echo "No provisioning profile specified, set PROVISIONING_PROFILE to change"
fi

if [ -z "$VERSION" ]; then
        VERSION="dev"
        echo "Build number: $VERSION, set VERSION to change"
fi

#Make sure target directory exists
mkdir -p $CURRENT_PATH/../target

COMMAND="xcrun -sdk iphoneos PackageApplication \
         -v $CURRENT_PATH/../platforms/ios/build/device/Workshop.app \
         -o $CURRENT_PATH/../target/workshop-${VERSION}.ipa"

if [ -z "$CODE_SIGNING_IDENTITY" ] || [ -z "$PROVISIONING_PROFILE" ]; then
	$COMMAND
else
	$COMMAND --embed "$PROVISIONING_PROFILE" --sign "$CODE_SIGNING_IDENTITY"
fi
