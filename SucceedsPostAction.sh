#!/bin/bash

#---------------------------------------------------------------------
# Bash script to be used as a 'Succeeds' post action in Xcode.
# This script will trigger SwiftLint when you compile a Swift Package.
#---------------------------------------------------------------------


#---------------------------------------------------------------------
# Debugging scripts run from the Succeeds Behavior is complex
# Logs, warnings and errors are not visible in the Build results
# One solution is to write to a file or use the say command.
#---------------------------------------------------------------------
#say "Run!"


#---------------------------------------------------------------------
# Check if swiftlint is installed and is an executable
#---------------------------------------------------------------------
SWIFTLINT_PATH="/usr/local/bin/swiftlint"
if ! [ -x "${SWIFTLINT_PATH}" ]
then
	SWIFTLINT_PATH="/opt/homebrew/bin/swiftlint"
	if ! [ -x "${SWIFTLINT_PATH}" ]
	then
	    exit 0
	fi
fi


#---------------------------------------------------------------------
# Get useful paths
#---------------------------------------------------------------------
SCRIPT_FOLDER_PATH=`dirname "$0"`
cd "${SCRIPT_FOLDER_PATH}"
SCRIPT_FOLDER_PATH=`pwd -P`


#---------------------------------------------------------------------
# Check if the developer is compiling a Swift package
#---------------------------------------------------------------------
if [ "${XcodeWorkspace}" != "package.xcworkspace" ]
then
	exit 0
fi


#---------------------------------------------------------------------
# Find the root folder of the Swift package
#---------------------------------------------------------------------
PACKAGE_WORKSPACE_SUFFIX="/.swiftpm/xcode/package.xcworkspace"
PACKAGE_ROOT_FOLDER="${XcodeWorkspacePath}"
PACKAGE_ROOT_FOLDER=${PACKAGE_ROOT_FOLDER%"${PACKAGE_WORKSPACE_SUFFIX}"}


#---------------------------------------------------------------------
# Check if the root folder of the package exists
#---------------------------------------------------------------------
if [ ! -d "${PACKAGE_ROOT_FOLDER}" ]
then
	exit 0
fi


#---------------------------------------------------------------------
# Run swiftlint
#---------------------------------------------------------------------
OUTPUT="${SWIFTLINT_PATH} ${PACKAGE_ROOT_FOLDER}"
OUTPUT_FILE_PATH="/tmp/swiftlint.txt"
${OUTPUT} > ${OUTPUT_FILE_PATH}


#---------------------------------------------------------------------
# Remove the lines containing /.build/
#---------------------------------------------------------------------
sed -i '' '/\/\.build\//d' ${OUTPUT_FILE_PATH}


#---------------------------------------------------------------------
# Check if the file is empty
#---------------------------------------------------------------------
if [ ! -s "${OUTPUT_FILE_PATH}" ]
then
	exit 0
fi


#---------------------------------------------------------------------
# Open result file in Xcode
#---------------------------------------------------------------------
xed ${OUTPUT_FILE_PATH}

