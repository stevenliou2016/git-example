%{
#include <iostream>
#include "dataType.h"
#include "symbolTable.h"
#include <map>

using namespace std;

void yyerror(char* s);
int yylex (void);
symTbl *rootTable, *localTable;

%}
%start statement
%union {
	int 		integer;
	char		character;
	char*		string;
	double		real;
	basic_Type	basicType;
	constant_Type	constantType;
}

/*****************Delimiters*********************/

%token TOKEN_COMMA TOKEN_COLON TOKEN_PERIOD TOKEN_SEMICOLON TOKEN_LEFT_PARENTHESE TOKEN_RIGHT_PARENTHESE TOKEN_LEFT_SQUARE_BRACKET TOKEN_RIGHT_SQUARE_BRACKET TOKEN_LEFT_BRACKET TOKEN_RIGHT_BRACKET

/*****************ArithmeticOperators************/

%token TOKEN_ADD TOKEN_SUB TOKEN_MUL TOKEN_DIV

/*****************RelationalOperators************/

%token TOKEN_LT TOKEN_LTE TOKEN_GTE TOKEN_GT TOKEN_EQ TOKEN_NEQ

/*****************LogicalOperators***************/

%token TOKEN_LOGICAL_AND TOKEN_LOGICAL_OR TOKEN_LOGICAL_NOT

/*****************Remainder**********************/

%token TOKEN_MOD

/*****************Assign*************************/

%token TOKEN_ASSIGN TOKEN_ASSIGN_ADD TOKEN_ASSIGN_SUB TOKEN_ASSIGN_MUL TOKEN_ASSIGN_DIV TOKEN_ASSIGN_MOD

/*****************Keywords***********************/

%token TOKEN_BOOLEAN TOKEN_BREAK TOKEN_CHAR TOKEN_CASE TOKEN_CLASS TOKEN_CONTINUE TOKEN_DEF TOKEN_DO TOKEN_ELSE TOKEN_EXIT TOKEN_FLOAT TOKEN_FOR TOKEN_IF TOKEN_INT TOKEN_NULL TOKEN_OBJECT TOKEN_PRINT TOKEN_PRINTLN TOKEN_REPEAT TOKEN_RETURN TOKEN_STRING TOKEN_TO TOKEN_TYPE TOKEN_VAL TOKEN_VAR TOKEN_WHILE

/*****************BooleanConstants****************/

%token TOKEN_TRUE TOKEN_FALSE

%token  <string>	TOKEN_ID
%token	<integer>	TOKEN_CONSTANT_INT
%token	<real>		TOKEN_CONSTANT_REAL
%token	<string>	TOKEN_CONSTANT_STRING

%type	<basicType>	constants
%type	<basicType>	expr statement

/**************operator priority*****************/

%left TOKEN_ASSIGN TOKEN_ASSIGN_ADD TOKEN_ASSIGN_SUB TOKEN_ASSIGN_MUL TOKEN_ASSIGN_DIV TOKEN_ASSIGN_MOD
%left TOKEN_LOGICAL_OR
%left TOKEN_LOGICAL_AND
%left TOKEN_EQ TOKEN_NEQ
%left TOKEN_LT TOKEN_LTE TOKEN_GT TOKEN_GTE
%left TOKEN_ADD TOKEN_SUB
%left TOKEN_MUL TOKEN_DIV
%left TOKEN_MOD
%nonassoc UMINUS

%%
/*
statement:expr {$$=$1;cout << $$ << endl;}
	 ;
*/
statement:	expr
	 	{
			cout << "expr" << endl;
	 	}
	/* |statement TOKEN_ID '=' expr '\n'
	 {
		//insert($1, $3);
		dump();
		cout << $$ << " statement" << endl;
	 }
	 */	/*|statement expr 
		{
			$$=$1;
			cout << $$ << endl;
		}
	 	|*/
	 	;

expr:	expr TOKEN_ADD expr 
	{
		cout << "expr+expr" << endl;
	}
       	|constants
	{
		$$=$1;
		cout << $1 << " exp" << endl;
	}
    	;

constants:TOKEN_CONSTANT_INT
	  {
		$$.integer=$1;
	  }
	  |TOKEN_CONSTANT_REAL
	  {
		$$.real=$1;
	  }
	  |TOKEN_CONSTANT_STRING
	  {
		$$.string=$1;
	  }
	  |TOKEN_TRUE
	  {
		$$.integer=1;
	  }
	  |TOKEN_FALSE
	  {
		$$.integer=0;
	  }
	  ;

id:TOKEN_ID
   {
	if(localTable->lookup($1)){
		yyerror("duplicated symbol\n");
	}else{
		if(localTable->insert($1,0)==0){
			cout << "insert failed\n" << endl;
		}
	}
   }

id_eval:TOKEN_ID
       {
		if(localTable->lookup($1)==0){
			yyerror("can't find symbol\n");
		}
       }
	
type:TOKEN_INT
    |TOKEN_FLOAT
    |TOKEN_STRING
    |TOKEN_TRUE
    |TOKEN_FALSE
    |TOKEN_CHAR
    ;

/*constant_declare:TOKEN_VAL id TOKEN_ASSIGN constants
		{
			
		}
		|TOKEN_VAL id TOKEN_COLON type TOKEN_ASSIGN constants
		;
*/
%%
void yyerror(char *s)
{
fprintf(stderr, "%s\n", s);
}
int main(void){
	rootTable=create(NULL);
	yyparse();
	return 0;
}
