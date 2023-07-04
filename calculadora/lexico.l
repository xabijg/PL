

%{
  #include <stdio.h>
  #include <stdlib.h>
  #include "sintactico.tab.h"
  int linea=0;
%}

DIGITO [0-9]
NUMERO {DIGITO}+("."{DIGITO}+)?

%%
{NUMERO} { yylval.real=atof(yytext); return(NUMERO); }
"="         { return(IGUAL); }
"+"         { return(MAS); }
"-"         { return(MENOS); }
";"         { return(PTOCOMA); }
"*"         { return(POR); }
"/"         { return(DIV); }
"("         { return(PAA); }
")"         { return(PAC); }
"\n"        { linea++; }
[\t\r\f] {}
" "         {}

.           { printf("Error lexico en linea %d", linea); }
%%

