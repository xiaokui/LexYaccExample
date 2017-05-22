#ifndef SYMBOLTABLE_H
#define SYMBOLTABLE_H


#define NSYMS 20


struct symtab {
    char *name;
    double value;
    double (*funcptr)(double);
};


struct symtab *symlook(char *s);


void addfunc(char *name, double (*func)(double));


#endif // SYMBOLTABLE_H
