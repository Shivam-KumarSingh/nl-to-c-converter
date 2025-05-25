#include <stdio.h>
#include <string.h>

int main() {
int x;
int y;
int result;
x = 10;
y = 5;
if (x > y) {
result = x * y;
printf("%d\n", result);
}
for(int i=0;i<3;i++){
x = x + i;
}
return 0;
}
