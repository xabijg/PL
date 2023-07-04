%{
#include <stdlib.h>
#include "p2.tab.h"
%}
%option yylineno
cabecera "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
delim [ \t\n]
ws {delim}+

comentario "<!--"UTF-8"-->"
tag_ini "<"[A-Za-z0-9]+">"
tag_fin "</"[A-Za-z0-9]+">"



%%
{ws} { }
{cabecera} {return CABECERA;}
{tag_ini} {yylval.valString = strdup(yytext); return TAG_INI;}
{tag_fin} {yylval.valString = strdup(yytext); return TAG_FIN;} 
{comentario} { }
. ;
%%
