#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAXLINE  10000


/* TODO:
   - fix malloc(): corrupted top size
*/


typedef struct option {
    struct alias *name;
    short isFlag;
    short required;
    char *value;  /* remains NULL if not found in args */
    struct option *next;
} option;

typedef struct alias {
    char *name;
    struct alias *next;
} alias;


char *heapString( char *stackString );

alias *createAlias( char *name );
void destroyAliases( alias *al );
alias *readAliases( char *start, char *end );

option *createOption( void );
void destroyOptions( option *op );
option *readOptions( void );
int validOptions( option *op );
void printOptions( option *op );
option *processArg( char **arg, option *start );
