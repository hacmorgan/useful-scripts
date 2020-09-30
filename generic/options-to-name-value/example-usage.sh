#!/bin/bash


# source $( type -p application-util )
# \-> once application util IS on path

source ./application-util


function options()
{
    cat <<EOF
--name,-n=<name>; default=horatio; any name you like
--very-important-value=<viv>; something I just have to know
--verbose; more output
EOF
}

function usage()
{
    cat <<EOF
boilerplate script that demonstrates how to use this utility
EOF
}

command-line-parse "$@"

printf "The name I was given is: " ; echo $options_name
