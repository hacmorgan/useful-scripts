#include "options-to-name-value.h"


option *createOption( void )
{
    option *op = malloc( sizeof( option ) );
    op->name = NULL;
    op->required = -1;
    op->isFlag = -1;
    op->value = NULL;
    op->next = NULL;
    return op;
}


void destroyOptions( option *op )
{
    if ( op == NULL ) {
        return;
    }
    if ( op->next != NULL ) {
        destroyOptions( op->next );
    }
    if ( op->value != NULL ) {
        free( op->value );
    }
    destroyAliases( op->name );
    free( op );
}


option *readOptions( void )
{
    char line[MAXLINE];
    char *semicolon;
    option *start = NULL;
    option *op;

    while ( fgets( line, MAXLINE, stdin ) != NULL )
    {
        semicolon = strchr( line, ';' );

        if ( semicolon == NULL ) {
            fprintf( stderr, "error: invalid option definition: %s", line );
            destroyOptions( start );
            exit(1);
        }

        if ( start == NULL ) {
            start = createOption();
            op = start;
        } else {
            op->next = createOption();
            op = op->next;
        }
        
        op->name = readAliases( line, semicolon );  /* populate aliases */

        if ( strstr( line, "=<" ) == NULL && strstr( line, "=[<" ) == NULL ) {
            op->isFlag = 1;
        } else {
            op->isFlag = 0;
        }
        
        char *defaultd = strstr( line, "default=" );
        if ( defaultd != NULL ) {
            defaultd += 8;  /* move to start of definition */
            semicolon = strchr( defaultd, ';' );
            char definition[semicolon-defaultd+1];
            strncpy( definition, defaultd, (semicolon-defaultd) );
            definition[semicolon-defaultd] = '\0';
            char *value = heapString( definition );
            op->value = value;
        }

        if ( strstr( line, "=[<" ) != NULL || op->isFlag ) {
            op->required = 0;
        } else {
            op->required = 1;
        }
    }

    return start;
}


int validOptions( option *op )
{
    if ( op == NULL ) {
        return 1;
    }
    
    if ( op->required && op->value == NULL ) {
        fprintf( stderr, "error: expected %s to be given\n", op->name->name );
        return 0;
    } else {
        return validOptions( op->next );
    }
}

void printOptions( option *op )
{
    if ( op == NULL ) {  /* base case */
        return;
    }
    if ( op->value != NULL ) {
        printf( "%s=\"%s\"\n", op->name->name, op->value );
    }
    printOptions( op->next );
    return;
}


option *matchOption( char *arg, option *start )
{
    alias *name = start->name;
    while ( name != NULL ) {
        if ( strstr( arg, name->name ) != NULL ) {
            return start;
        }
        name = name->next;
    }
    if ( start->next == NULL ) {
        return NULL;
    } else {
        return matchOption( arg, start->next );
    }
}

option *processArg( char **arg, option *start )
{
    if ( *arg == NULL ) {
        return start;
    }

    option *matchingOption = matchOption( *arg, start );

    if ( matchingOption == NULL ) {
        fprintf( stderr, "error: no option found matching %s\n", *arg );
        return NULL;
    }

    if ( matchingOption->isFlag ) {
        matchingOption->value = heapString( "1" );
        return processArg( ++arg, start );
    }
    
    char *equal = strchr( *arg, '=' );
    if ( equal == NULL ) {  /* value is in next argument */
        char *value = *(++arg);
        if ( value == NULL ) {
            fprintf( stderr, "error: expected value for optional argument %s\n", *(--arg) );
            return NULL;
        }
        matchingOption->value = heapString( value );
    } else {  /* format: name=value */
        char *end = strchr( *arg, '\0' );
        char value[end-equal];
        strcpy( value, equal+1 );
        matchingOption->value = heapString( value );
    }

    return processArg( ++arg, start );
}
