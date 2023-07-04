CC=gcc
LEX=flex
YACC=bison

CFLAGS=-Wall -Wextra
LDFLAGS=-lfl -lm

OBJS=lex.yy.o sintactico.tab.o

all: calculadora

calculadora: $(OBJS)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(OBJS)

lex.yy.c: lexico.l sintactico.tab.h
	$(LEX) $<

sintactico.tab.c sintactico.tab.h: sintactico.y
	$(YACC) -d $<

clean:
	rm -f $(OBJS) lex.yy.c sintactico.tab.c sintactico.tab.h calculadora

test: calculadora
	./calculadora < input.txt

.PHONY: test

