#!/usr/bin/env bash
OUTPUT_FILE=${1}

if [[ ! -z ${1} ]]; then
		echo "Temporary folder..."
		mkdir $OUTPUT_FILE
		cp -R HotelLister "${OUTPUT_FILE}/"
		cp -R cordova-plugin-hotel-lister "${OUTPUT_FILE}/"
		echo "Clean... ${1}"

		if [ "${1}" = "starter-project" ]; then
			rm -rf "${OUTPUT_FILE}/HotelLister/platforms/android/app/src/main/assets/travel-sample.cblite2.zip"
			rm -rf "${OUTPUT_FILE}/cordova-plugin-hotel-lister/src/android/DatabaseManager.java"
			rm -rf "${OUTPUT_FILE}/cordova-plugin-hotel-lister/src/android/HotelLister.java"
		elif [ "${1}" = "final-project" ]; then
			echo ""
		else
			echo "Error: the output file must be called starter-project or final-project"
		fi

		rm -rf "${OUTPUT_FILE}/HotelLister/node_modules/"
		rm -rf "${OUTPUT_FILE}/HotelLister/platforms/android/app/build"
		rm -rf "${OUTPUT_FILE}/HotelFinder/platforms/android/.idea"
		rm -rf "${OUTPUT_FILE}/HotelFinder/platforms/android/.gradle"
		rm -rf "${OUTPUT_FILE}/HotelFinder/platforms/android/local.properties"
		rm -rf "${OUTPUT_FILE}/HotelFinder/platforms/android/HotelFinder.iml"

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