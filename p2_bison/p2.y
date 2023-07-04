%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
extern int yylex();
extern int yylineno;

void yyerror (char const *);
%}


%union{
	char* valString;
}



%token CABECERA
%token <valString> TAG_INI
%token <valString> TAG_FIN
%type lista_lineas bloque
%start S
%%
S : CABECERA lista_lineas { printf("Texto correcto.");}
	| error lista_lineas {yyerror("Cabecera inexistente o incorrecta."); exit(0);}
	;
	
lista_lineas: lista_lineas bloque
	| bloque
	;

bloque: TAG_INI TAG_FIN { if(strcmp($1+1, $2+2)!=0){
		printf("Error: encontrada sintaxis %s y se esperaba </%s (linea: %d)\n", $2, $1+1, yylineno); exit(0);}
		}
	| TAG_INI lista_lineas TAG_FIN { if(strcmp($1+1, $3+2)!=0){
		printf("Error: encontrada sintaxis %s y se esperaba </%s(linea: %d)\n", $3, $1+1, yylineno); exit(0);}
		}
	;
%%
int main() {
	yyparse();
	return 0;
}
void yyerror (char const *message) { fprintf (stderr, "%s\n",message);}
