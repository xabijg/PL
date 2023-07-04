%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

extern int yylex(void);
extern char *yytext;
extern int linea;
extern FILE *yyin;

void yyerror(char *s);

%}

%union {
  float real;
}

%start Exp_l

%token <real> NUMERO
%token MAS
%token MENOS
%token IGUAL
%token PTOCOMA
%token POR
%token DIV
%token PAA
%token PAC

/* No Terminales, que tambien podemos especificar su tipo */
%type <real> Exp
%type <real> Calc
%type <real> Exp_l

/* Definimos las precedencias de menor a mayor */
%left MAS MENOS
%left POR DIV

%%

Exp_l: Exp_l Calc  
     | Calc
;

Calc: Exp PTOCOMA {
  printf("%4.1f\n", $1);
}
;

Exp: NUMERO {
  $$ = $1;
}
  | Exp MAS Exp {
  $$ = $1 + $3;
}
  | Exp MENOS Exp {
  $$ = $1 - $3;
}
  | Exp POR Exp {
  $$ = $1 * $3;
}
  | Exp DIV Exp {
  $$ = $1 / $3;
  
}
  | PAA Exp PAC {
  $$ = $2;
}



  | Exp POR { yyerror("Error: falta operando en la multiplicacion"); }
  | Exp MAS { yyerror("Error: falta operando en la suma"); }
  | Exp MENOS { yyerror("Error: falta operando en la resta"); }
  /*
  | PAA Exp { yyerror("Error: falta parentesis de cierre"); $$ = $2; }
  | Exp PAC { yyerror("Error: falta parentesis de apertura"); $$ = $1; }
  */
;

%%

void yyerror(char *s) {
  printf("Error sintactico: %s\n", s);
}

int main(int argc, char **argv) {
  if (argc > 1) {
    yyin = fopen(argv[1], "rt");
  } else {
    yyin = stdin;
  }

  yyparse();
  return 0;
}


