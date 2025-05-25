# Makefile
CC=gcc
CFLAGS=-Wall -Wno-unused-function

all: compiler

compiler: lex.yy.c y.tab.c
	$(CC) $(CFLAGS) lex.yy.c y.tab.c -o compiler

lex.yy.c: c.l y.tab.h
	lex c.l

y.tab.c y.tab.h: c.y
	yacc -d c.y

clean:
	rm -f compiler lex.yy.c y.tab.c y.tab.h *.o
