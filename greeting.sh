#!/bin/bash

lolcat ~/greeting.txt
# vscode hello
if [[ "$TERM_PROGRAM" == "vscode" ]]; then
    echo "hello vscode" | lolcat
fi
# terminator hello
if [[ "$TERMINATOR_UUID" != "" ]]; then
    echo "hello terminator" | lolcat
fi
