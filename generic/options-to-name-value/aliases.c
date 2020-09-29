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

alias *readAliases( char *start, char *end )
{
    if ( start >= end ) {
        return NULL;
    }

    char *comma = strchr( start, ',' );
    if ( comma == NULL || comma > end ) {
        comma = end;
    }
    
    char name[comma-start+1];
    strncpy( name, start, (comma-start) );

    name[comma-start] = '\0';
    
    alias *al = createAlias( name );
    al->next = readAliases( ++comma, end );
    return al;
}
