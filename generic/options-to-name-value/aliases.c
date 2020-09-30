#include "options-to-name-value.h"


alias *createAlias( char *name ) {
    alias *al = malloc( sizeof( alias ) );
    al->name = heapString( name );
    al->next = NULL;
}


void destroyAliases( alias *al )
{
    if ( al->next != NULL ) {
        destroyAliases( al->next );
    }
    if ( al->name != NULL ) {
        free( al->name );
    }
    free( al );
}


char *endOfName( char *start, char *end )
{
    char *comma = strchr( start, ',' );
    char *equal = strchr( start, '=' );

    /* anything after the semicolon is not part of the name */
    if ( comma > end ) {
        comma == NULL;
    }
    if ( equal > end ) {
        equal == NULL;
    }

    if ( comma == NULL && equal == NULL ) {
        return end;
    }
    if ( comma == NULL ) {
        return equal;
    }
    return comma;
    
}

alias *readAliases( char *start, char *end )
{
    if ( start >= end ) {
        return NULL;
    }

    char *comma = endOfName( start, end );
    
    char name[comma-start+1];
    strncpy( name, start, (comma-start) );

    name[comma-start] = '\0';
    
    alias *al = createAlias( name );
    al->next = readAliases( ++comma, end );
    return al;
}
