/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

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

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    PRINT = 258,                   /* PRINT  */
    DECLARE = 259,                 /* DECLARE  */
    SET = 260,                     /* SET  */
    ADD = 261,                     /* ADD  */
    SUBTRACT = 262,                /* SUBTRACT  */
    MULTIPLY = 263,                /* MULTIPLY  */
    DIVIDE = 264,                  /* DIVIDE  */
    IF = 265,                      /* IF  */
    THEN = 266,                    /* THEN  */
    WHILE = 267,                   /* WHILE  */
    DO = 268,                      /* DO  */
    IS = 269,                      /* IS  */
    GREATER = 270,                 /* GREATER  */
    LESS = 271,                    /* LESS  */
    EQUAL = 272,                   /* EQUAL  */
    AND = 273,                     /* AND  */
    OR = 274,                      /* OR  */
    END = 275,                     /* END  */
    ARRAY = 276,                   /* ARRAY  */
    OF = 277,                      /* OF  */
    SIZE = 278,                    /* SIZE  */
    INTEGER_TYPE = 279,            /* INTEGER_TYPE  */
    FLOAT_TYPE = 280,              /* FLOAT_TYPE  */
    STRING_TYPE = 281,             /* STRING_TYPE  */
    ARRAY_TYPE = 282,              /* ARRAY_TYPE  */
    FOR = 283,                     /* FOR  */
    IN = 284,                      /* IN  */
    RANGE = 285,                   /* RANGE  */
    TAKE = 286,                    /* TAKE  */
    USER = 287,                    /* USER  */
    INPUT = 288,                   /* INPUT  */
    IDENTIFIER = 289,              /* IDENTIFIER  */
    STRING = 290,                  /* STRING  */
    NUMBER = 291,                  /* NUMBER  */
    DECIMAL = 292                  /* DECIMAL  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif
/* Token kinds.  */
#define YYEMPTY -2
#define YYEOF 0
#define YYerror 256
#define YYUNDEF 257
#define PRINT 258
#define DECLARE 259
#define SET 260
#define ADD 261
#define SUBTRACT 262
#define MULTIPLY 263
#define DIVIDE 264
#define IF 265
#define THEN 266
#define WHILE 267
#define DO 268
#define IS 269
#define GREATER 270
#define LESS 271
#define EQUAL 272
#define AND 273
#define OR 274
#define END 275
#define ARRAY 276
#define OF 277
#define SIZE 278
#define INTEGER_TYPE 279
#define FLOAT_TYPE 280
#define STRING_TYPE 281
#define ARRAY_TYPE 282
#define FOR 283
#define IN 284
#define RANGE 285
#define TAKE 286
#define USER 287
#define INPUT 288
#define IDENTIFIER 289
#define STRING 290
#define NUMBER 291
#define DECIMAL 292

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 14 "c.y"

    int number;
    double decimal;
    char* string;

#line 147 "y.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
