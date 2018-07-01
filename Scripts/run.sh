#!/bin/bash

if [ ! -f "bin/Updater" ]; then
  sourceFiles=$(find Source -type f -name "*.swift" ! -path "*/Tests/*")

  for sourceFile in $sourceFiles
  do
    sourceList=$sourceList$sourceFile" "
  done
  echo "building "$sourceList
  swiftc $sourceList -o "bin/SwiftToShell"
fi
#./Updater $commits
