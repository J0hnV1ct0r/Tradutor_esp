%{
#include "parser.tab.h"
%}

%%

"\""([^"\n]|\"\")*"\"" { 
    yylval.str_val = strdup(yytext); // Captura a string completa com aspas
    return STRING;
}

"//".*  { yylval.str_val = strdup(yytext); return COMENTARIO; }
"/\*([^*]|\*+[^*/])*\*+/"  { yylval.str_val = strdup(yytext); return COMENTARIO; }

"const"    { return CONSTANTE; }
"incluir"      { return INCLUIR; }
"config"       { return CONFIG; }
"fim"          { return FIM; }
"repita"       { return REPITA; }
"esperar"      { return ESPERAR; }
"var"          { return VAR; }
"inteiro"      { return INTEIRO; }
"booleano"     { return BOOLEANO; }
"texto"        { return TEXTO; }

"configurar"       { return CONFIGURAR; }
"saida"            { return SAIDA; }
"entrada"          { return ENTRADA; }
"ligar"            { return LIGAR; }
"desligar"         { return DESLIGAR; }
"lerDigital"       { return LER_DIGITAL; }
"lerAnalogico"     { return LER_ANALOGICO; }
"escreverAnalogico"     { return ESCREVER_ANALOGICO; }
"mudar"            { return MUDAR; }
"configurarSerial" { return CONFIGURAR_SERIAL; }
"escreverSerial"   { return ESCREVER_SERIAL; }
"lerSerial"        { return LER_SERIAL; }
"="                 { return IGUAL; }
":"                 { return DOISPONTOS; }
"se" { return SE; }
"senao" { return SENAO; }
"entao" { return ENTAO; }
"enquanto" { return ENQUANTO; }

"+"    { yylval.str_val = strdup(yytext); return OPERADOR; }
"-"    { yylval.str_val = strdup(yytext); return OPERADOR; }
"*"     { yylval.str_val = strdup(yytext); return OPERADOR; }
"/"     { yylval.str_val = strdup(yytext); return OPERADOR; }

"=="    { yylval.str_val = strdup(yytext); return OPERADOR_COMPARACAO; }
"!="    { yylval.str_val = strdup(yytext); return OPERADOR_COMPARACAO; }
">"     { yylval.str_val = strdup(yytext); return OPERADOR_COMPARACAO; }
"<"     { yylval.str_val = strdup(yytext); return OPERADOR_COMPARACAO; }
">="    { yylval.str_val = strdup(yytext); return OPERADOR_COMPARACAO; }
"<="    { yylval.str_val = strdup(yytext); return OPERADOR_COMPARACAO; }


"true"             { return TRUE; }
"false"            { return FALSE; }
[0-9]+             { yylval.int_val = atoi(yytext); return NUMERO; }
[a-zA-Z_][a-zA-Z0-9_]* { yylval.str_val = strdup(yytext); return IDENT; }

[ \t\n]+           { /* Ignorar espaços e quebras de linha */ }

%%

int yywrap(void) {
    return 1;
}