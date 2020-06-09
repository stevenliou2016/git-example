//#include "parser.h"
#ifndef _DATATYPE_H
#define _DATATYPE_H

struct constant_Type{
	int	dataType;
	union{
		int	integer;
		double 	real;
		char* 	string;
	};
};

struct basic_Type{
	int dataType;
	int 	integer;
	char 	character;
	char* 	string;
	bool	boolean;
	double	real;
};
#endif
