#include <iostream>
#include "tokens.h"
const char * getTokenSymbol(enum yytokentype token){
	switch(token){
		case TOKEN_COMMA:		return ",";
		case TOKEN_COLON:		return ":";
		case TOKEN_PERIOD:		return ".";
		case TOKEN_SEMICOLON:		return ";";
		case TOKEN_LEFT_PARENTHESE:	return "(";
		case TOKEN_RIGHT_PARENTHESE:	return ")";
		case TOKEN_LEFT_SQUARE_BRACKET:	return "[";
		case TOKEN_RIGHT_SQUARE_BRACKET:return "]";
		case TOKEN_LEFT_BRACKET:	return "{";
		case TOKEN_RIGHT_BRACKET:	return "}";
		case TOKEN_ADD:			return "+";
		case TOKEN_SUB:			return "-";
		case TOKEN_MUL:			return "*";
		case TOKEN_DIV:			return "/";
		case TOKEN_MOD:			return "%";
		case TOKEN_LT:			return "<";
		case TOKEN_LTE:			return "<=";
		case TOKEN_GTE:			return ">=";
		case TOKEN_GT:			return ">";
		case TOKEN_EQ:			return "==";
		case TOKEN_NEQ:			return "!=";
		case TOKEN_LOGICAL_AND:		return "&&";
		case TOKEN_LOGICAL_OR:		return "||";
		case TOKEN_LOGICAL_NOT:		return "!";
		case TOKEN_BOOLEAN:		return "BOOLEAN";
		case TOKEN_BREAK:		return "BREAK";
		case TOKEN_CHAR:		return "CHAR";
		case TOKEN_CASE:		return "CASE";
		case TOKEN_CLASS:		return "CLASS";
		case TOKEN_CONTINUE:		return "CONTINUE";
		case TOKEN_DEF:			return "DEF";
		case TOKEN_DO:			return "DO";
		case TOKEN_ELSE:		return "ELSE";
		case TOKEN_EXIT:		return "EXIT";
		case TOKEN_FALSE:		return "FALSE";
		case TOKEN_FLOAT:		return "FLOAT";
		case TOKEN_FOR:			return "FOR";
		case TOKEN_IF:			return "IF";
		case TOKEN_INT:			return "INT";
		case TOKEN_NULL:		return "NULL";
		case TOKEN_OBJECT:		return "OBJECT";
		case TOKEN_PRINT:		return "PRINT";
		case TOKEN_PRINTLN:		return "PRINTLN";
		case TOKEN_REPEAT:		return "REPEAT";
		case TOKEN_RETURN:		return "RETURN";
		case TOKEN_STRING:		return "STRING";
		case TOKEN_TO:			return "TO";
		case TOKEN_TRUE:		return "TRUE";
		case TOKEN_TYPE:		return "TYPE";
		case TOKEN_VAL:			return "VAL";
		case TOKEN_VAR:			return "VAR";
		case TOKEN_WHILE:		return "WHILE";
		case TOKEN_ID:			return "IDENTIFIER";
		case TOKEN_CONSTANT_INT:	return "CONSTANT_INT";
		case TOKEN_CONSTANT_REAL:	return "CONSTANT_REAL";
		case TOKEN_CONSTANT_STRING:	return "CONSTANT_STRING";
		case TOKEN_ASSIGN:		return "ASSIGN";
		case TOKEN_ASSIGN_ADD:		return "ASSIGN_ADD";
		case TOKEN_ASSIGN_SUB:		return "ASSIGN_SUB";
		case TOKEN_ASSIGN_MUL:		return "ASSIGN_MUL";
		case TOKEN_ASSIGN_DIV:		return "ASSIGN_DIV";
		case TOKEN_ASSIGN_MOD:		return "ASSIGN_MOD";
		deault:				return NULL;		
	}
}
