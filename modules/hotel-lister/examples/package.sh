#!/usr/bin/env bash
OUTPUT_FILE=${1}

if [[ ! -z ${1} ]]; then
		echo "Temporary folder..."
		mkdir $OUTPUT_FILE
		cp -R HotelLister "${OUTPUT_FILE}/"
		cp -R cordova-plugin-hotel-lister "${OUTPUT_FILE}/"
		echo "Clean... ${1}"

		if [ "${1}" = "starter-project" ]; then
			cd "${OUTPUT_FILE}/HotelLister"
			cordova plugin rm cordova-plugin-hotel-lister
			cd ../..
			rm -rf "${OUTPUT_FILE}/HotelLister/platforms/"
			rm -rf "${OUTPUT_FILE}/HotelLister/plugins/"
			rm -rf "${OUTPUT_FILE}/cordova-plugin-hotel-lister/src/android/DatabaseManager.java"
			rm -rf "${OUTPUT_FILE}/cordova-plugin-hotel-lister/src/android/HotelLister.java"
			rm -rf "${OUTPUT_FILE}/cordova-plugin-hotel-lister/src/ios/DatabaseManager.swift"
			rm -rf "${OUTPUT_FILE}/cordova-plugin-hotel-lister/src/ios/HotelLister.swift"
			rm -rf "${OUTPUT_FILE}/cordova-plugin-hotel-lister/www/hotel-lister.js"
			rm -rf "${OUTPUT_FILE}/cordova-plugin-hotel-lister/package.json"
			rm -rf "${OUTPUT_FILE}/cordova-plugin-hotel-lister/plugin.xml"
		elif [ "${1}" = "final-project" ]; then
			echo ""
			rm -rf "${OUTPUT_FILE}/HotelLister/platforms/android/app/build"
			rm -rf "${OUTPUT_FILE}/HotelLister/platforms/android/build"
			rm -rf "${OUTPUT_FILE}/HotelLister/platforms/android/.idea"
			rm -rf "${OUTPUT_FILE}/HotelLister/platforms/android/.gradle"
			rm -rf "${OUTPUT_FILE}/HotelLister/platforms/android/local.properties"
			rm -rf "${OUTPUT_FILE}/HotelLister/platforms/android/HotelLister.iml"
			rm -rf "${OUTPUT_FILE}/HotelLister/platforms/ios/Frameworks/CouchbaseLiteSwift.framework"
		else
			echo "Error: the output file must be called starter-project or final-project"
		fi

		rm -rf "${OUTPUT_FILE}/HotelLister/node_modules/"

		echo "Zipping..."
		ditto -c -k --sequesterRsrc --keepParent "${OUTPUT_FILE}" "${OUTPUT_FILE}.zip"
		echo "Copy..."
		cp "${OUTPUT_FILE}.zip" "../assets/attachments/${OUTPUT_FILE}.zip"
		echo "Delete..."
		rm -rf $OUTPUT_FILE
		rm "${OUTPUT_FILE}.zip"
	else
		echo "Error: you must provide the output file as an argument."
fi