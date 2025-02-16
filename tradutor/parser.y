%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void yyerror(const char *s);
int yylex(void);
%}

%union {
    int int_val;    /* Para NUMERO */
    char* str_val;  /* Para IDENT e STRING */
}

%token INCLUIR CONFIG FIM REPITA ESPERAR CONFIGURAR_SERIAL CONFIGURAR LER_DIGITAL LIGAR DESLIGAR MUDAR
%token VAR ESCREVER_SERIAL LER_SERIAL CONSTANTE LER_ANALOGICO ESCREVER_ANALOGICO
%token INTEIRO BOOLEANO TEXTO SAIDA ENTRADA 
%token IGUAL DOISPONTOS SE SENAO ENTAO ENQUANTO
%token TRUE FALSE
%token <int_val> NUMERO
%token <str_val> IDENT STRING COMENTARIO OPERADOR OPERADOR_COMPARACAO

%%

entrada:
    inclusao_list configuracao repeticao
    ;

inclusao_list:
    inclusao inclusao_list
    |
    ;

inclusao:
    INCLUIR IDENT { 
        printf("#include <%s.h>\n", $2);  
        free($2);
    }
    | CONSTANTE { printf("const "); } declaracao
    | declaracao
    | COMENTARIO { printf("%s\n", $1); free($1); }
    ;

configuracao:
    CONFIG { 
        printf("\nvoid setup() {\n");
    }
    comando_list FIM {
        printf("}\n");
    }
    ;

repeticao:
    REPITA { 
        printf("\nvoid loop() {\n");
    } comando_list FIM {
        printf("}\n");
    }
    ;

comando_list:
    comando comando_list
    |
    ;

comando:
    controle_fluxo
    | ESPERAR NUMERO {
        printf("  delay(%d);\n", $2);
    }
    | CONFIGURAR_SERIAL NUMERO { 
        printf("  Serial.begin(%d);\n", $2);
    }
    | ESCREVER_SERIAL STRING {
        printf("  Serial.print(%s);\n", $2);
        free($2);
    }
    | ESCREVER_SERIAL IDENT {
        printf("  Serial.print(%s);\n", $2);
        free($2);
    }
    | CONFIGURAR IDENT SAIDA {
        printf("  pinMode(%s, OUTPUT);\n", $2);
        free($2);
    }
    | CONFIGURAR IDENT ENTRADA {
        printf("  pinMode(%s, INPUT);\n", $2);
        free($2);
    }
    | LIGAR IDENT {
        printf("  digitalWrite(%s, true);\n", $2);
        free($2);
    }
    | DESLIGAR IDENT {
        printf("  digitalWrite(%s, false);\n", $2);
        free($2);
    }
    | IDENT IGUAL LER_DIGITAL IDENT {
        printf("  bool %s = digitalRead(%s);\n", $1, $4);
        free($1);
        free($4);
    }
    | VAR BOOLEANO DOISPONTOS IDENT IGUAL LER_DIGITAL IDENT {
        printf("  bool %s = digitalRead(%s);\n", $4, $7);
        free($4);
        free($7);
    }
    | IDENT IGUAL LER_ANALOGICO IDENT {
        printf("  %s = analogRead(%s);\n", $1, $4);
        free($1);
        free($4);
    }
    | VAR INTEIRO DOISPONTOS IDENT IGUAL LER_ANALOGICO IDENT {
        printf("  int %s = analogRead(%s);\n", $4, $7);
        free($4);
        free($7);
    }
    | MUDAR IDENT IDENT {
        printf("  digitalWrite(%s, %s);\n", $2, $3);
        free($2);
        free($3);
    }
    | ESCREVER_ANALOGICO IDENT NUMERO {
        printf("  analogWrite(%s, %d);\n", $2, $3);
        free($2);
    }   
    | ESCREVER_ANALOGICO IDENT IDENT {
        printf("  analogWrite(%s, %s);\n", $2, $3);
        free($2);
        free($3);
    }
    | declaracao
    | atribuicao
    | COMENTARIO { printf("%s\n", $1); free($1); }
    ;

declaracao:
    VAR INTEIRO DOISPONTOS IDENT { 
        printf("  int %s;\n", $4);
        free($4);
    }
    | VAR BOOLEANO DOISPONTOS IDENT { 
        printf("  bool %s;\n", $4);
        free($4);
    }
    | VAR TEXTO DOISPONTOS IDENT { 
        printf("  String %s;\n", $4);
        free($4);
    }
    | VAR INTEIRO DOISPONTOS IDENT IGUAL NUMERO { 
        printf("  int %s = %d;\n", $4, $6);
        free($4);
    }
    | VAR BOOLEANO DOISPONTOS IDENT IGUAL TRUE { 
        printf("  bool %s = true;\n", $4);
        free($4);
    }
    | VAR BOOLEANO DOISPONTOS IDENT IGUAL FALSE { 
        printf("  bool %s = false;\n", $4);
        free($4);
    }
    | VAR TEXTO DOISPONTOS IDENT IGUAL STRING { 
        printf("  String %s = %s;\n", $4, $6);
        free($4);
    }
    ;

atribuicao:
    IDENT IGUAL NUMERO { 
        printf("  %s = %d;\n", $1, $3);
        free($1);
    }
    | IDENT IGUAL TRUE { 
        printf("  %s = true;\n", $1);
        free($1);
    }
    | IDENT IGUAL FALSE { 
        printf("  %s = false;\n", $1);
        free($1);
    }
    | IDENT IGUAL STRING { 
        printf("  %s = %s;\n", $1, $3);
        free($1);
        free($3);
    }
    | IDENT IGUAL IDENT { 
        printf("  %s = %s;\n", $1, $3);
        free($1);
        free($3);
    }
    | VAR TEXTO DOISPONTOS IDENT IGUAL LER_SERIAL {
        printf("  String %s = Serial.readString();\n", $4);
        free($4);
    }
    | IDENT IGUAL IDENT OPERADOR NUMERO {
        printf("  %s = %s %s %d\n", $1, $3, $4, $5);
        free($1);
        free($3);
        free($4);
    }
    | IDENT IGUAL IDENT OPERADOR IDENT {
        printf("  %s = %s %s %s\n", $1, $3, $4, $5);
        free($1);
        free($3);
        free($4);
        free($5);
    }
    | IDENT IGUAL NUMERO OPERADOR NUMERO {
        printf("  %s = %d %s %d\n", $1, $3, $4, $5);
        free($1);
        free($4);
    }
    | IDENT IGUAL NUMERO OPERADOR IDENT {
        printf("  %s = %d %s %s\n", $1, $3, $4, $5);
        free($1);
        free($4);
        free($5);
    }
    ;

controle_fluxo:
    SE  {printf("if ");} condicao ENTAO {printf("{\n");}
    comando_list fim_fluxo
    | ENQUANTO condicao {printf("while ");} {printf(" {\n");} comando_list fim_fluxo
    ;

condicao:
    IDENT OPERADOR_COMPARACAO NUMERO {
        printf("(%s %s %d)", $1, $2, $3);
        free($1);
    }
    | IDENT OPERADOR_COMPARACAO IDENT {
        printf("(%s %s %s)", $1, $2, $3);
        free($1);
        free($3);
    }
    ;

fim_fluxo:
    FIM { 
        printf("}\n");
    }
    | SENAO {
        printf("else {\n");
    } comando_list fim_fluxo  { 
        printf("}\n");
    }
    ;

%%

int main() {
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Erro: %s\n", s);
}
