all:
	yacc parser.y --output=parser.c --defines=parser.h
	lex -o scanner.c scanner.l
	g++ -g -c -o symbolTable.o symbolTable.c
	g++ -g -c -o parser.o parser.c
	g++ -g -c -o tokens.o tokens.c
	g++ -g -c -o scanner.o scanner.c
	g++ -g scanner.o parser.o tokens.o symbolTable.o -ll -ly -o parser

clean:
	rm *.o parser.c scanner.c parser.h

