#!/bin/bash

# Load the shell files
for file in ~/.{basic,git,python,dotnet,asdf,docker,editors,misc,cleanup}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

echo ">>>> That's all, rock on!"
