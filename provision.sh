#!/bin/bash

# Load the shell files
for file in ~/.{basic,git,python,haskell,dotnet,asdf,vagrant,docker,editors,misc,terraform,cleanup}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

echo ">>>> That's all, rock on!"
