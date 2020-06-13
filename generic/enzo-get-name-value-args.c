#include <stdio.h>
#include <string.h>

int die(char msg[])
{
    fprintf( stderr, msg );
    return 1;
}

int isFlag(char arg[])
{
	if (arg[0] == '-' || arg[1] == '-')
	{
		return 1;
	} else {
		return 0;
	}
}

int isDefinition(char myArg[])
{
	// we only need to search for an '=' because if it's also a flag, then it is guaranteed
	// to also be a definition
	for (int i=0; i<strlen(myArg); i++)
	{
		if (myArg[i] == '=')
		{
			return 1;
		}
	}
	return 0;
}


int main(int argc, char* argv[])
{
	char outputString[] = "";
    int expectingFlag = 1;
    //printf("1st char of 1st arg: %c\n", argv[1][0]);
  	if (argc >= 2)
    {
        for ( int i=1; i < argc; i++ )
        {
            if (expectingFlag == 0)
            {
                if (isFlag(argv[i]))
                {
                    strcat(outputString, "=1\n");
                }
                else
                {
                    strcat(outputString, "=");
                }
            }

            
            printf("argument no. %d: %s", i, argv[i]);
            if (flagAndDefinition(argv[i]))
            {
                printf("This is a flag and a definition in one\n");
            }
            else if (isFlag(argv[i]))
            {
                printf("This is just a flag\n");
            }
            printf("\n\n");
        }
    }
  
    /* char str[100]; */
    /* fgets( str, 100, stdin ); */
    /* printf("\n You entered: "); */
    /* puts( str ); */
}
