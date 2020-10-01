#include "options-to-name-value.h"


int main( int argc, char **argv )
{
    
    option *start = readOptions();
    if ( processArg( ++argv, start ) == NULL ) {
        exit(1);  /* processArg can print the error */
    }

    if ( ! validOptions( start ) ) {
        exit(1);
    }

    printOptions( start );
    
    destroyOptions( start );
    
    return 0;
}


char *heapString( char *stackString )
{
    char *hs = malloc( strlen( stackString ) + 1 );
    strcpy( hs, stackString );
    return hs;
}
