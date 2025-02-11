%{
#include <stdio.h>
#include "parser.tab.h"

%}

%option noyywrap

%%

"repita"                { return REPITA; }
"verdadeiro"            { return VERDADEIRO; }
"falso"                 { return FALSO; }
"como"                  { return COMO; }
"saida"                 { return SAIDA; }
"entrada"               { return ENTRADA; }

"ligar"                { return LIGAR; }
"desligar"             { return DESLIGAR; }
"ler_digital"          { return LER_DIGITAL; }
"ler_analogico"        { return LER_ANALOGICO; }
"pwm"                  { return PWM; }
"com"                  { return COM; }
"frequencia"           { return FREQUENCIA; }
"resolucao"            { return RESOLUCAO; }
"ajustar_pwm"          { return AJUSTAR_PWM; }
"conectar_wifi"        { return CONECTAR_WIFI; }
"senha"                { return SENHA; }
"enviar_http"          { return ENVIAR_HTTP; }
"dados"                { return DADOS; }
"configurar_serial"    { return CONFIGURAR_SERIAL; }
"escrever_serial"      { return ESCREVER_SERIAL; }
"ler_serial"           { return LER_SERIAL; }
"esperar"              { return ESPERAR; }

"configurar"           { return CONFIGURAR; }
"config"               { return CONFIG; }
"var"                  { return VAR; }
"se"                   { return SE; }
"entao"                { return ENTAO; }
"senao"                { return SENAO; }
"enquanto"             { return ENQUANTO; }

"inteiro"              { return INTEIRO; }
"booleano"             { return BOOLEANO; }
"texto"                { return TEXTO; }

"="                    { return ATRIBUICAO; }
"+"                    { return SOMA; }
"-"                    { return SUBTRACAO; }
"*"                    { return MULTIPLICACAO; }
"/"                    { return DIVISAO; }

"=="                   { return IGUAL; }
"!="                   { return DIFERENTE; }
"<"                    { return MENOR; }
">"                    { return MAIOR; }
"<="                   { return MENOR_OU_IGUAL; }
">="                   { return MAIOR_OU_IGUAL; }

"("                    { return '('; }
")"                    { return ')'; }
";"                    { return FIM; }

[a-zA-Z_][a-zA-Z0-9_]* { yylval.str = strdup(yytext); return IDENTIFICADOR; }
[0-9]+                 { yylval.num = atoi(yytext); return INTEIRO_LITERAL; }
\"[^\"]*\"             { yylval.str = strdup(yytext + 1); yylval.str[strlen(yylval.str) - 1] = '\0'; return TEXTO_LITERAL; }

[ \t\n]+               { /* Ignorar espaços e quebras de linha */ }

.                      { fprintf(stderr, "Caractere inválido: %s\n", yytext); }

%%

