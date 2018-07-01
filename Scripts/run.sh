#!/bin/bash

sourceFiles=$(find . -type f -name "*.swift" ! -path "*/Tests/*")
for sourceFile in $sourceFiles
do
sourceList=$sourceList$sourceFile" "
done

swiftc $sourceList -o Updater
./Updater $commits
