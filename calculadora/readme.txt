

NOTA:DEJO COMENTADAS LAS LINEAS DE ERRORES DE PARENTESIS DEL DOCUMENTO SINTACTICO.Y 77 Y 78 DEBIDO A QUE ME DAN WARNING A MAYORES.SIN EMBARGO SI SE DESCOMETNAN FUNCIONAN PERFECTAMENTE.

COMPILACION

flex lexico.l

bison -d sintactico.y

cc lex.yy.c sintactico.tab.c -o calculadora -lfl -lm

./calculadora


o hacer
(da warnings)

make 
./calculadora
