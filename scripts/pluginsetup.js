#!/usr/bin/env node

//This script will add or remove all plugins listed in package.json

//usage: node plugins.js [ add | remove ]

var packageJson = require('../package.json');
console.log("Starting plugin install");
//var cordova_raw = require('cordova-lib').cordova.raw;

var fs = require('fs');
var path = require('path');
var sys = require('sys')
var exec = require('child_process').exec;

function processPlugins() {
    for ( var key in packageJson.cordovaPlugins ) {

    	var version = packageJson.cordovaPlugins[key];
        var plugin = key

        pluginName = plugin + '@' + version;
        console.log("Installing " + pluginName);

        //var pluginCmd = cordova_raw.plugin('add', pluginName);
        pluginCmd = "cordova plugin add " + plugin + "@" + version;
        exec(pluginCmd, function (error, stdout, stderr) {
		console.log(stdout);
        });
    }
}

processPlugins();
