/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    TOKEN_COMMA = 258,
    TOKEN_COLON = 259,
    TOKEN_PERIOD = 260,
    TOKEN_SEMICOLON = 261,
    TOKEN_LEFT_PARENTHESE = 262,
    TOKEN_RIGHT_PARENTHESE = 263,
    TOKEN_LEFT_SQUARE_BRACKET = 264,
    TOKEN_RIGHT_SQUARE_BRACKET = 265,
    TOKEN_LEFT_BRACKET = 266,
    TOKEN_RIGHT_BRACKET = 267,
    TOKEN_ADD = 268,
    TOKEN_SUB = 269,
    TOKEN_MUL = 270,
    TOKEN_DIV = 271,
    TOKEN_LT = 272,
    TOKEN_LTE = 273,
    TOKEN_GTE = 274,
    TOKEN_GT = 275,
    TOKEN_EQ = 276,
    TOKEN_NEQ = 277,
    TOKEN_LOGICAL_AND = 278,
    TOKEN_LOGICAL_OR = 279,
    TOKEN_LOGICAL_NOT = 280,
    TOKEN_MOD = 281,
    TOKEN_ASSIGN = 282,
    TOKEN_ASSIGN_ADD = 283,
    TOKEN_ASSIGN_SUB = 284,
    TOKEN_ASSIGN_MUL = 285,
    TOKEN_ASSIGN_DIV = 286,
    TOKEN_ASSIGN_MOD = 287,
    TOKEN_BOOLEAN = 288,
    TOKEN_BREAK = 289,
    TOKEN_CHAR = 290,
    TOKEN_CASE = 291,
    TOKEN_CLASS = 292,
    TOKEN_CONTINUE = 293,
    TOKEN_DEF = 294,
    TOKEN_DO = 295,
    TOKEN_ELSE = 296,
    TOKEN_EXIT = 297,
    TOKEN_FLOAT = 298,
    TOKEN_FOR = 299,
    TOKEN_IF = 300,
    TOKEN_INT = 301,
    TOKEN_NULL = 302,
    TOKEN_OBJECT = 303,
    TOKEN_PRINT = 304,
    TOKEN_PRINTLN = 305,
    TOKEN_REPEAT = 306,
    TOKEN_RETURN = 307,
    TOKEN_STRING = 308,
    TOKEN_TO = 309,
    TOKEN_TYPE = 310,
    TOKEN_VAL = 311,
    TOKEN_VAR = 312,
    TOKEN_WHILE = 313,
    TOKEN_TRUE = 314,
    TOKEN_FALSE = 315,
    TOKEN_ID = 316,
    TOKEN_CONSTANT_INT = 317,
    TOKEN_CONSTANT_REAL = 318,
    TOKEN_CONSTANT_STRING = 319,
    UMINUS = 320
  };
#endif
/* Tokens.  */
#define TOKEN_COMMA 258
#define TOKEN_COLON 259
#define TOKEN_PERIOD 260
#define TOKEN_SEMICOLON 261
#define TOKEN_LEFT_PARENTHESE 262
#define TOKEN_RIGHT_PARENTHESE 263
#define TOKEN_LEFT_SQUARE_BRACKET 264
#define TOKEN_RIGHT_SQUARE_BRACKET 265
#define TOKEN_LEFT_BRACKET 266
#define TOKEN_RIGHT_BRACKET 267
#define TOKEN_ADD 268
#define TOKEN_SUB 269
#define TOKEN_MUL 270
#define TOKEN_DIV 271
#define TOKEN_LT 272
#define TOKEN_LTE 273
#define TOKEN_GTE 274
#define TOKEN_GT 275
#define TOKEN_EQ 276
#define TOKEN_NEQ 277
#define TOKEN_LOGICAL_AND 278
#define TOKEN_LOGICAL_OR 279
#define TOKEN_LOGICAL_NOT 280
#define TOKEN_MOD 281
#define TOKEN_ASSIGN 282
#define TOKEN_ASSIGN_ADD 283
#define TOKEN_ASSIGN_SUB 284
#define TOKEN_ASSIGN_MUL 285
#define TOKEN_ASSIGN_DIV 286
#define TOKEN_ASSIGN_MOD 287
#define TOKEN_BOOLEAN 288
#define TOKEN_BREAK 289
#define TOKEN_CHAR 290
#define TOKEN_CASE 291
#define TOKEN_CLASS 292
#define TOKEN_CONTINUE 293
#define TOKEN_DEF 294
#define TOKEN_DO 295
#define TOKEN_ELSE 296
#define TOKEN_EXIT 297
#define TOKEN_FLOAT 298
#define TOKEN_FOR 299
#define TOKEN_IF 300
#define TOKEN_INT 301
#define TOKEN_NULL 302
#define TOKEN_OBJECT 303
#define TOKEN_PRINT 304
#define TOKEN_PRINTLN 305
#define TOKEN_REPEAT 306
#define TOKEN_RETURN 307
#define TOKEN_STRING 308
#define TOKEN_TO 309
#define TOKEN_TYPE 310
#define TOKEN_VAL 311
#define TOKEN_VAR 312
#define TOKEN_WHILE 313
#define TOKEN_TRUE 314
#define TOKEN_FALSE 315
#define TOKEN_ID 316
#define TOKEN_CONSTANT_INT 317
#define TOKEN_CONSTANT_REAL 318
#define TOKEN_CONSTANT_STRING 319
#define UMINUS 320

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 8 "parser.y" /* yacc.c:1909  */

	int	integer;
	char*	string;
	double	real;

#line 190 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
