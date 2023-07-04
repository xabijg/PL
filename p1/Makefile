### Mkefile
# CODIGO: fichero .l
CODIGO = p1
# BASE: fichero base de prueba
BASE = text.txt
# LIB (libreria flex): lfl (gnu/linux, windows); ll (macos)
LIB = lfl

all: compile

compile:
	flex $(CODIGO).l
	gcc -o $(CODIGO) lex.yy.c -$(LIB)

clean:
	rm $(CODIGO) lex.yy.c 

run:
	./$(CODIGO) < $(BASE)

run2:
	./$(CODIGO)

