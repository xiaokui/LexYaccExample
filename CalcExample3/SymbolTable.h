#ifndef SYMBOLTABLE_H
#define SYMBOLTABLE_H


#define NSYMS 20


struct symtab {
    char *name;
    double value;
};


struct symtab *symlook(char *s);



#endif // SYMBOLTABLE_H
