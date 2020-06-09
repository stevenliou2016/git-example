%{
#define DETAIL_LOG 0

#if DETAIL_LOG == 1
#define PRINTF(FMT, ...) printf(FMT, __VA_ARGS__)
#else
#define PRINTF(FMT, ...)
#endif
#include <iostream>
#include "dataType.h"
#include "tokens.h"
#include "parser.h"
using namespace std;
#define LIST     {strcat(buf,yytext);}
#define token(t) {LIST;return t;}
#define tokenInteger(t,i) {LIST;yylval.integer = stoi(i);return t;}
#define tokenReal(t,r) {LIST;yylval.real = stod(r);return t;}
#define tokenString(t,s) {LIST;yylval.string = s;return t;}

#define MAX_LINE_LENG 256

int linenum = 1,temp=0,indexCount=-1;
char buf[MAX_LINE_LENG];
char stringBuf[MAX_LINE_LENG];
%}

letters	[a-zA-Z_]
digits	[0-9]
%s stringConstants singleLineComments multiLineComments
%%

 /*****************delimiters*********************/

<INITIAL>"," {token(TOKEN_COMMA);}
<INITIAL>":" {token(TOKEN_COLON);}
<INITIAL>"." {token(TOKEN_PERIOD);}
<INITIAL>";" {token(TOKEN_SEMICOLON);}
<INITIAL>"(" {token(TOKEN_LEFT_PARENTHESE);}
<INITIAL>")" {token(TOKEN_RIGHT_PARENTHESE);}
<INITIAL>"[" {token(TOKEN_LEFT_SQUARE_BRACKET);}
<INITIAL>"]" {token(TOKEN_RIGHT_SQUARE_BRACKET);}
<INITIAL>"{" {token(TOKEN_LEFT_BRACKET);}
<INITIAL>"}" {token(TOKEN_RIGHT_BRACKET);}

 /*****************signleLineComments*************/

<INITIAL>"//" {LIST;strcat(stringBuf,yytext);BEGIN singleLineComments;}
<singleLineComments>[^\n] {LIST;strcat(stringBuf,yytext);BEGIN singleLineComments;}
<singleLineComments>\n {LIST;strcat(stringBuf,yytext);printf("%d: %s", linenum++, stringBuf);stringBuf[0]='\0';buf[0]='\0';BEGIN INITIAL;}

 /*****************multiLineComments**************/

<INITIAL>"/*" {LIST;strcat(stringBuf,yytext);BEGIN multiLineComments;}
<multiLineComments>\n {LIST;temp++;strcat(stringBuf,yytext);BEGIN multiLineComments;}
<multiLineComments>"*/" {LIST;stringBuf[0]='\0';BEGIN INITIAL;}
<multiLineComments>[^\n] {LIST;strcat(stringBuf,yytext);BEGIN multiLineComments;}

 /*****************ArithmeticOperators************/

<INITIAL>"+" {token(TOKEN_ADD);}
<INITIAL>"-" {token(TOKEN_SUB);}
<INITIAL>"*" {token(TOKEN_MUL);}
<INITIAL>"/" {token(TOKEN_DIV);}

 /*****************RelationalOperators************/

<INITIAL>"<"  {token(TOKEN_LT);}
<INITIAL>"<=" {token(TOKEN_LTE);}
<INITIAL>">"  {token(TOKEN_GT);}
<INITIAL>">=" {token(TOKEN_GTE);}
<INITIAL>"==" {token(TOKEN_EQ);}
<INITIAL>"!=" {token(TOKEN_NEQ);}

 /*****************Assign*************************/

<INITIAL>"="  {token(TOKEN_ASSIGN);}
<INITIAL>"+=" {token(TOKEN_ASSIGN_ADD);}
<INITIAL>"-=" {token(TOKEN_ASSIGN_SUB);}
<INITIAL>"*=" {token(TOKEN_ASSIGN_MUL);}
<INITIAL>"/=" {token(TOKEN_ASSIGN_DIV);}
<INITIAL>"%=" {token(TOKEN_ASSIGN_MOD);}

 /*****************LogicalOperators***************/

<INITIAL>"&&" {token(TOKEN_LOGICAL_AND);}
<INITIAL>"||" {token(TOKEN_LOGICAL_OR);}
<INITIAL>"!"  {token(TOKEN_LOGICAL_NOT);}

 /*****************Remainder**********************/

<INITIAL>"%" {token(TOKEN_MOD);}

 /*****************Keywords***********************/

<INITIAL>"boolean"	{token(TOKEN_BOOLEAN);}
<INITIAL>"break"	{token(TOKEN_BREAK);}
<INITIAL>"char"		{token(TOKEN_CHAR);}
<INITIAL>"case"		{token(TOKEN_CASE);}
<INITIAL>"class"	{token(TOKEN_CLASS);}
<INITIAL>"continue"	{token(TOKEN_CONTINUE);}
<INITIAL>"def"		{token(TOKEN_DEF);}
<INITIAL>"do"		{token(TOKEN_DO);}
<INITIAL>"else"		{token(TOKEN_ELSE);}
<INITIAL>"exit"		{token(TOKEN_EXIT);}
<INITIAL>"float"	{token(TOKEN_FLOAT);}
<INITIAL>"for"		{token(TOKEN_FOR);}
<INITIAL>"if"		{token(TOKEN_IF);}
<INITIAL>"int"		{token(TOKEN_INT);}
<INITIAL>"null"		{token(TOKEN_NULL);}
<INITIAL>"object"	{token(TOKEN_OBJECT);}
<INITIAL>"print"	{token(TOKEN_PRINT);}
<INITIAL>"println"	{token(TOKEN_PRINTLN);}
<INITIAL>"repeat"	{token(TOKEN_REPEAT);}
<INITIAL>"return"	{token(TOKEN_RETURN);}
<INITIAL>"string"	{token(TOKEN_STRING);}
<INITIAL>"to"		{token(TOKEN_TO);}
<INITIAL>"type"		{token(TOKEN_TYPE);}
<INITIAL>"val"		{token(TOKEN_VAL);}
<INITIAL>"var"		{token(TOKEN_VAR);}
<INITIAL>"while"	{token(TOKEN_WHILE);}

 /*****************BooleanConstants****************/

<INITIAL>"true"		{tokenString(TOKEN_TRUE,yytext);}
<INITIAL>"false"	{tokenString(TOKEN_FALSE,yytext);}

 /*****************RealConstants*******************/

<INITIAL>[+-]?{digits}+"."{digits}+("e"|"E")[+-]?{digits}+ {tokenReal(TOKEN_CONSTANT_REAL,yytext);}

<INITIAL>[+-]?{digits}+"."{digits}+ {tokenReal(TOKEN_CONSTANT_REAL,yytext);}

 /*****************IntegerConstants****************/

<INITIAL>[+-]?{digits}* {tokenInteger(TOKEN_CONSTANT_INT,yytext);}

 /*****************StringConstants*****************/

<INITIAL>\" {LIST;BEGIN stringConstants;}
<stringConstants>([^"])|("\"\"") {LIST;strcat(stringBuf,yytext);BEGIN stringConstants;}
<stringConstants>\" {tokenString(TOKEN_CONSTANT_STRING,yytext);stringBuf[0]='\0';BEGIN INITIAL;}

 /*****************Identifiers********************/

<INITIAL>{letters}+{digits}*{letters}* {tokenString(TOKEN_ID,yytext);}

<INITIAL>\n      {
        LIST;
        printf("%d: %s", linenum++, buf);
	linenum+=temp;
	temp=0;
        buf[0] = '\0';
        }

<INITIAL>[ \t]*  {LIST;}

<INITIAL>.       {
        LIST;
        printf("%d:%s\n", linenum+1, buf);
        printf("bad character:'%s'\n",yytext);
        exit(-1);
        }
%%
