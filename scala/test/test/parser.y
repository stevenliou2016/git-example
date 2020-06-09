%{
# include <stdio.h>
# include <ctype.h>
int yylex();
int yyerror(char* s);
int regs[26];
int base;
%}
%start list
%token DIGIT LETTER EXIT_COMMAND TOKEN_ADD
%left '|'
%left '&'
%left '+' '-'
%left '*' '/' '%'
%left UMINUS /* supplies precedence for unary minus */

%%

list : /* empty */
        |stat
	{
		printf("stat\n");
	}
	|list stat '\n'
	{
		printf("stat\n");
	}
	| list error '\n'
	{
		yyerrok;
	}
	| EXIT_COMMAND
	{
		exit(EXIT_SUCCESS);
	}
	;
stat : expr
	{
		//(void) printf( "%d\n", $1 );
		printf("expr\n");
	}
	| LETTER '=' expr
	{
		regs[$1] = $3;
	}
	;
expr : '(' expr ')'
	{
		$$ = $2;
	}
	| expr TOKEN_ADD expr
	{
		$$ = $1 + $3;
	}
	| expr '-' expr
	{
		$$ = $1 - $3;
	}
	| expr '*' expr
	{
		$$ = $1 * $3;
	}
	| expr '/' expr
	{
		$$ = $1 / $3;
	}
	| expr '%' expr
	{
		$$ = $1 % $3;
	}
	| expr '&' expr
	{
		$$ = $1 & $3;
	}
	| expr '|' expr
	{
		$$ = $1 | $3;
	}
	| '-' expr %prec UMINUS
	{
		$$ = -$2;
	}
	| LETTER
	{
		$$ = regs[$1];
		printf("letter\n");
	}
	| number
	{
		printf("number\n");
	}
	;
number : DIGIT
	{
		$$ = $1; base = ($1==0) ? 8 : 10;
		printf("Digits\n");
	}
	| number DIGIT
	{
		$$ = base * $1 + $2;
	}
	;

%%
int yyerror(char *s)
{
fprintf(stderr, "%s\n", s);
return 0;
}
int main(void)
{
yyparse();
return 0;
}
 /* beginning of subroutines section */
/*int yylex( ) /* lexical analysis routine */
//{ /* return LETTER for lowercase letter, */
/* yylval = 0 through 25 returns DIGIT */
/* for digit, yylval = 0 through 9 */
/* all other characters are returned immediately */
//int c;
/*skip blanks*/
//while ((c = getchar()) == ' ')
//;
/* c is now nonblank */
/*if (islower(c)) {
yylval = c - 'a';
return (LETTER);
}
if (isdigit(c)) {
yylval = c - '0';
return (DIGIT);
}
return (c);
}*/
