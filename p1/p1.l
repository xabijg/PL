%{
unsigned char_count = 0, word_count = 0, upper_count = 0, lower_count = 0, num_count = 0, line_count = 0, sentence_count = 0;
%}
word [^ \t\n"."]+
lower [a-z]
upper [A-Z]
digit [0-9]
delimiter [ \t\n]
end_of_line \n
%%
{lower}+ {word_count++; lower_count++; char_count += yyleng;}
{upper}+ {word_count++; upper_count++; char_count += yyleng;}
{digit}+ {word_count++; num_count++; char_count += yyleng;}
"." {sentence_count++; char_count++;}
{word} {word_count++; char_count += yyleng;}
{end_of_line} {line_count++; }
{delimiter} { }
. {char_count++;}
%%
main()
{
yylex();
printf("Lines:%d Words:%d Lowercase:%d Uppercase:%d Numeric:%d Characters:%d Sentences:%d\n", line_count, word_count, lower_count, upper_count, num_count, char_count, sentence_count);
}

