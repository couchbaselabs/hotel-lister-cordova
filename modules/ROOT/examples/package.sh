#!/usr/bin/env bash
OUTPUT_FILE=${1}

if [[ ! -z ${1} ]]; then
		echo "Temporary folder..."
		mkdir $OUTPUT_FILE
		cp -R HotelFinder "${OUTPUT_FILE}/"
		echo "Clean... ${1}"

		if [ "${1}" = "starter-project" ]; then
			rm -rf "${OUTPUT_FILE}/HotelFinder/ios/HotelFinder/travel-sample.cblite2"
			rm -rf "${OUTPUT_FILE}/HotelFinder/android/app/src/main/assets/travel-sample.cblite2.zip"
		elif [ "${1}" = "final-project" ]; then
			echo ""
		else
			echo "Error: the output file must be called starter-project or final-project"
		fi

		rm -rf "${OUTPUT_FILE}/HotelFinder/node_modules/"
		rm -rf "${OUTPUT_FILE}/HotelFinder/ios/Frameworks/CouchbaseLiteSwift.framework"
		rm -rf "${OUTPUT_FILE}/HotelFinder/android/app/build"
		rm -rf "${OUTPUT_FILE}/HotelFinder/android/.idea"
		rm -rf "${OUTPUT_FILE}/HotelFinder/android/.gradle"
		rm -rf "${OUTPUT_FILE}/HotelFinder/android/local.properties"
		rm -rf "${OUTPUT_FILE}/HotelFinder/android/HotelFinder.iml"

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