%{
#include "parser.h"
%}
%%
"+" {return TOKEN_ADD;}
"exit" {return EXIT_COMMAND;}
[a-zA-Z]+ {
yylval = yytext[0];
return LETTER;
}
[0-9]+ {
yylval = atoi(yytext);
return DIGIT;
}
[ \t\n] ;
[+-=;]	{return yytext[0];}
. {ECHO; printf("unexpected character\n");}

%%

int yywrap(void) {return 1;}
