win_flex lexer.l
win_bison -d parser.y
gcc parser.tab.c lex.yy.c -o translator
Get-Content entrada.txt | .\translator.exe > saida.txt