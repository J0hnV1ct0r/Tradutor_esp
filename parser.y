%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h> // Adicionado para evitar warnings

int yylex(void);
void yyerror(const char *s);
%}

%union {
    int num;
    char* str;
}

%token REPITA VERDADEIRO FALSO COMO SAIDA ENTRADA
%token LIGAR DESLIGAR LER_DIGITAL LER_ANALOGICO PWM
%token COM FREQUENCIA RESOLUCAO AJUSTAR_PWM CONECTAR_WIFI
%token SENHA ENVIAR_HTTP DADOS CONFIGURAR_SERIAL ESCREVER_SERIAL
%token LER_SERIAL ESPERAR TEXTO_LITERAL

%token <num> INTEIRO_LITERAL
%token <str> IDENTIFICADOR
%token CONFIGURAR CONFIG VAR SE ENTAO SENAO ENQUANTO
%token INTEIRO BOOLEANO TEXTO
%token ATRIBUICAO
%token SOMA SUBTRACAO MULTIPLICACAO DIVISAO
%token IGUAL DIFERENTE MENOR MAIOR MENOR_OU_IGUAL MAIOR_OU_IGUAL
%token '(' ')'
%token FIM

%type <num> expressao termo fator
%type <str> tipo comando

%left SOMA SUBTRACAO
%left MULTIPLICACAO DIVISAO
%left IGUAL DIFERENTE
%left MENOR MAIOR MENOR_OU_IGUAL MAIOR_OU_IGUAL

%%

programa:
    comando
  | programa comando
  ;

comando:
    CONFIG CONFIGURAR IDENTIFICADOR { printf("Configuração: %s\n", $3); }
  | VAR tipo IDENTIFICADOR ATRIBUICAO expressao { printf("Variável %s atribuída com valor %d\n", $3, $5); }
  | SE expressao ENTAO comando SENAO comando { printf("Condição avaliada\n"); }
  | ENQUANTO expressao comando { printf("Loop enquanto\n"); }
  ;

tipo:
    INTEIRO { $$ = strdup("inteiro"); }
  | BOOLEANO { $$ = strdup("booleano"); }
  | TEXTO { $$ = strdup("texto"); }
  ;

expressao:
    expressao SOMA termo { $$ = $1 + $3; }
  | expressao SUBTRACAO termo { $$ = $1 - $3; }
  | termo { $$ = $1; }
  ;

termo:
    termo MULTIPLICACAO fator { $$ = $1 * $3; }
  | termo DIVISAO fator { $$ = $1 / $3; }
  | fator { $$ = $1; }
  ;

fator:
    IDENTIFICADOR { $$ = 0; /* Apenas um identificador, valor fictício */ }
  | INTEIRO_LITERAL { $$ = $1; }
  | TEXTO_LITERAL { $$ = 0; /* Apenas para compatibilidade */ }
  ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Erro sintático: %s\n", s);
}



