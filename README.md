# Natural Language to C Code Converter

A compiler design project that translates structured natural language commands into equivalent C code using **Lex and Yacc**.

## 💡 Features
- Variable declarations (`declare x is integer`)
- Assignments, arithmetic (`add`, `subtract`, etc.)
- Loops (`for`, `while`), conditionals (`if`)
- User input/output (`take input`, `print`)
- Array handling and indexed operations

## 🛠️ Technologies
- Lex (Flex) for lexical analysis
- Yacc (Bison) for parsing
- C for code generation
- Linux environment

## 📂 Sample Input
- declare x is integer
- set x is 10
- print x

## 📄 Output C Code

```c
int x;
x = 10;
printf("%d\n", x);
```
## 🚀 Getting Started

```bash
make
./compiler output.c < input.txt
gcc output.c -o output
./output
