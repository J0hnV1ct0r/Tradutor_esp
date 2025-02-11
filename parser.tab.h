
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     REPITA = 258,
     VERDADEIRO = 259,
     FALSO = 260,
     COMO = 261,
     SAIDA = 262,
     ENTRADA = 263,
     LIGAR = 264,
     DESLIGAR = 265,
     LER_DIGITAL = 266,
     LER_ANALOGICO = 267,
     PWM = 268,
     COM = 269,
     FREQUENCIA = 270,
     RESOLUCAO = 271,
     AJUSTAR_PWM = 272,
     CONECTAR_WIFI = 273,
     SENHA = 274,
     ENVIAR_HTTP = 275,
     DADOS = 276,
     CONFIGURAR_SERIAL = 277,
     ESCREVER_SERIAL = 278,
     LER_SERIAL = 279,
     ESPERAR = 280,
     TEXTO_LITERAL = 281,
     INTEIRO_LITERAL = 282,
     IDENTIFICADOR = 283,
     CONFIGURAR = 284,
     CONFIG = 285,
     VAR = 286,
     SE = 287,
     ENTAO = 288,
     SENAO = 289,
     ENQUANTO = 290,
     INTEIRO = 291,
     BOOLEANO = 292,
     TEXTO = 293,
     ATRIBUICAO = 294,
     SOMA = 295,
     SUBTRACAO = 296,
     MULTIPLICACAO = 297,
     DIVISAO = 298,
     IGUAL = 299,
     DIFERENTE = 300,
     MENOR = 301,
     MAIOR = 302,
     MENOR_OU_IGUAL = 303,
     MAIOR_OU_IGUAL = 304,
     FIM = 305
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 1676 of yacc.c  */
#line 10 "parser.y"

    int num;
    char* str;



/* Line 1676 of yacc.c  */
#line 109 "parser.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


