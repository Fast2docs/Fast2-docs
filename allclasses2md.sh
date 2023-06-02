#!/bin/bash

source="tempFiles/"
target="docs/catalog"
find $source -name "com.fast2.*.md" -exec rm {} \;

# add auto-generated documentation from allClasses from software
xsltproc allclasses.xsl allclasses.xml

for i in $(find $source* -type d); do 
    filename="${i/$source/""}".md
    cat $i/*.temp > $target/"${filename,,}"
done

rm -rf $source
