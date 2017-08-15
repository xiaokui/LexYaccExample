#ifndef SYMBOLTABLE_H
#define SYMBOLTABLE_H


// 默认符号表的长度是20，存放20个自定义函数
#define NSYMS 20

// 符号表信息
struct symtab {
    char *name;                 // 名称
    double value;               // 数据
    double (*funcptr)(double);  // 操作函数
};


struct symtab *symlook(char *s);


void addfunc(char *name, double (*func)(double));


#endif // SYMBOLTABLE_H
