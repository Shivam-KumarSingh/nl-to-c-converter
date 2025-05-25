/* parser.y */
%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void yyerror(const char *s);
extern int yylex();
extern int line_num;

FILE* output_file;
%}

%union {
    int number;
    double decimal;
    char* string;
}

%token PRINT DECLARE SET ADD SUBTRACT MULTIPLY DIVIDE
%token IF THEN WHILE DO IS GREATER LESS EQUAL AND OR END ARRAY OF SIZE
%token INTEGER_TYPE FLOAT_TYPE STRING_TYPE ARRAY_TYPE
%token FOR IN RANGE
%token TAKE USER INPUT
%token <string> IDENTIFIER STRING
%token <number> NUMBER
%token <decimal> DECIMAL

%%

program:
    statements
    ;

statements: statement
    	  | statements statement;

statement: declaration
	 | assignment
    	 | print_statement
    	 | if_statement
    	 | while_statement
    	 |for_loop
    	 |user_input;

declaration:
    DECLARE IDENTIFIER IS INTEGER_TYPE  {
        fprintf(output_file, "int %s;\n", $2);
        free($2);
    }
    | DECLARE IDENTIFIER IS FLOAT_TYPE  {
        fprintf(output_file, "float %s;\n", $2);
        free($2);
    }
    | DECLARE IDENTIFIER IS STRING_TYPE {
        fprintf(output_file, "char %s[100];\n", $2);
        free($2);
    }
    | DECLARE IDENTIFIER IS ARRAY_TYPE OF SIZE NUMBER{
    	fprintf(output_file, "int %s[%d];\n", $2,$7);
        free($2);
    } ;

assignment:
    SET IDENTIFIER IS NUMBER {
        fprintf(output_file, "%s = %d;\n", $2, $4);
        free($2);
    }
    | SET IDENTIFIER IS DECIMAL {
        fprintf(output_file, "%s = %f;\n", $2, $4);
        free($2);
    }
    | SET IDENTIFIER IS STRING {
        fprintf(output_file, "strcpy(%s, %s);\n", $2, $4);
        free($2);
        free($4);
        
    }
    |SET IDENTIFIER IS IDENTIFIER ADD IDENTIFIER{
    	fprintf(output_file,"%s = %s + %s;\n",$2,$4,$6);
    	free($2);
    	free($4);
    	free($6);
    }
    |SET IDENTIFIER IS IDENTIFIER MULTIPLY IDENTIFIER{
    	fprintf(output_file,"%s = %s * %s;\n",$2,$4,$6);
    	free($2);
    	free($4);
    	free($6);
    }
    |SET IDENTIFIER IS IDENTIFIER SUBTRACT IDENTIFIER{
    	fprintf(output_file,"%s = %s - %s;\n",$2,$4,$6);
    	free($2);
    	free($4);
    	free($6);
    }
    |SET IDENTIFIER IS IDENTIFIER DIVIDE IDENTIFIER{
    	fprintf(output_file,"%s = %s/%s;\n",$2,$4,$6);
    	free($2);
    	free($4);
    	free($6);
    }
    |SET IDENTIFIER IS IDENTIFIER ADD NUMBER{
    	fprintf(output_file,"%s = %s + %d;\n",$2,$4,$6);
    	free($2);
    	free($4);
    }
    |SET IDENTIFIER IS IDENTIFIER MULTIPLY NUMBER{
    	fprintf(output_file,"%s = %s * %d;\n",$2,$4,$6);
    	free($2);
    	free($4);
    }
    |SET IDENTIFIER IS IDENTIFIER DIVIDE NUMBER{
    	fprintf(output_file,"%s = %s / %d;\n",$2,$4,$6);
    	free($2);
    	free($4);
    }
    |SET IDENTIFIER IS IDENTIFIER SUBTRACT NUMBER{
    	fprintf(output_file,"%s = %s - %d;\n",$2,$4,$6);
    	free($2);
    	free($4);
    }
    
    
    |SET IDENTIFIER '[' NUMBER ']' IS IDENTIFIER MULTIPLY NUMBER {
        fprintf(output_file, "%s[%d] = %s * %d;\n", $2, $4, $7, $9);
        free($2);
        free($7);
    }
    
    |SET IDENTIFIER '[' NUMBER ']' IS IDENTIFIER ADD NUMBER {
        fprintf(output_file, "%s[%d] = %s + %d;\n", $2, $4, $7, $9);
        free($2);
        free($7);
    }
    
    |SET IDENTIFIER '[' NUMBER ']' IS IDENTIFIER SUBTRACT NUMBER {
        fprintf(output_file, "%s[%d] = %s - %d;\n", $2, $4, $7, $9);
        free($2);
        free($7);
    }
    |SET IDENTIFIER '[' NUMBER ']' IS IDENTIFIER DIVIDE NUMBER {
        fprintf(output_file, "%s[%d] = %s / %d;\n", $2, $4, $7, $9);
        free($2);
        free($7);
    }
    |SET IDENTIFIER '[' IDENTIFIER ']' IS IDENTIFIER MULTIPLY  IDENTIFIER{
        fprintf(output_file, "%s[%s] = %s * %s;\n", $2, $4, $7, $9);
        free($2);
        free($4);
        free($7);
    }
    |SET IDENTIFIER '[' IDENTIFIER ']' IS IDENTIFIER ADD IDENTIFIER {
        fprintf(output_file, "%s[%s] = %s + %s;\n", $2, $4, $7, $9);
        free($2);
        free($4);
        free($7);
    }
    |SET IDENTIFIER '[' IDENTIFIER ']' IS IDENTIFIER SUBTRACT IDENTIFIER {
        fprintf(output_file, "%s[%s] = %s - %s;\n", $2, $4, $7, $9);
        free($2);
        free($4);
        free($7);
    }
    |SET IDENTIFIER '[' IDENTIFIER ']' IS IDENTIFIER DIVIDE IDENTIFIER {
        fprintf(output_file, "%s[%s] = %s / %s;\n", $2, $4, $7, $9);
        free($2);
        free($4);
        free($7);
    }
    
    ;

print_statement:
    PRINT IDENTIFIER {
        fprintf(output_file, "printf(\"%%d\\n\", %s);\n", $2);
        free($2);
    }
    ;

if_statement:
    IF condition THEN statements END{
        fprintf(output_file, "}\n");
    }
    ;

while_statement:
	WHILE condition DO statements END {
        fprintf(output_file, "}\n");
    };
for_loop:FOR range THEN statements END{
	fprintf(output_file, "}\n");
	 
};
range: IDENTIFIER IN  RANGE NUMBER NUMBER{
	fprintf(output_file,"for(int %s=%d;%s<%d;%s++){\n",$1,$4,$1,$5,$1);
	
};
user_input:TAKE INTEGER_TYPE USER INPUT IN IDENTIFIER  {
    	   fprintf(output_file,"scanf(\"%%d\", &%s);\n", $6);
}
	

condition:
    IDENTIFIER GREATER IDENTIFIER {
        fprintf(output_file, "if (%s > %s) {\n", $1, $3);
        free($1);
        free($3);
    }
    | IDENTIFIER LESS IDENTIFIER {
        fprintf(output_file, "if (%s < %s) {\n", $1, $3);
        free($1);
        free($3);
    }
    | IDENTIFIER EQUAL IDENTIFIER {
        fprintf(output_file, "if (%s == %s) {\n", $1, $3);
        free($1);
        free($3);
    }
    |IDENTIFIER LESS NUMBER{
    	fprintf(output_file, "if (%s < %d) {\n", $1, $3);
    }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error at line %d: %s\n", line_num, s);
}

int main(int argc, char **argv) {
    if (argc != 2) {
        printf("Usage: %s output_file\n", argv[0]);
        return 1;
    }
    
    output_file = fopen(argv[1], "w");
    if (!output_file) {
        printf("Could not open output file\n");
        return 1;
    }
    
    // Write necessary includes
    fprintf(output_file, "#include <stdio.h>\n");
    fprintf(output_file, "#include <string.h>\n\n");
    fprintf(output_file, "int main() {\n");
    
    yyparse();
    
    // Close main function
    fprintf(output_file, "return 0;\n}\n");
    fclose(output_file);
    return 0;
}
