#include "options-to-name-value.h"


int main( int argc, char **argv )
{
    
    printf( "here\n" );
    option *start = readOptions();
    fprintf( stderr, "here\n" );
    if ( processArg( ++argv, start ) == NULL ) {
        exit(1);  /* processArg can print the error */
    }

    fprintf( stderr, "here\n" );
    if ( ! validOptions( start ) ) {
        exit(1);
    }

    fprintf( stderr, "here\n" );
    printOptions( start );
    
    fprintf( stderr, "here\n" );
    destroyOptions( start );
    
    return 0;
}


char *heapString( char *stackString )
{
    char *hs = malloc( sizeof( stackString ) );
    strcpy( hs, stackString );
    return hs;
}
