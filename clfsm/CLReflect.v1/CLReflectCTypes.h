#ifndef CLREFLECTCTYPES_H
#define CLREFLECTCTYPES_H

typedef struct
    {
        const char *name;
        const char *type;
    }
    clproperty_t;

typedef struct
    {
        const char * value;
        clproperty_t property;
    }
    clboundproperty_t;
    
#endif
