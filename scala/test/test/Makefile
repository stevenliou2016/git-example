all:
	lex -o scanner.c scanner.l
	yacc parser.y --output=parser.c --defines=parser.h
	g++ scanner.c parser.c -o parser

clean:
	rm scanner.c parser parser.c parser.h
