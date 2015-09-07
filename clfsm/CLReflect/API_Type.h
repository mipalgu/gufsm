#ifndef API_TYPE_H
#define API_TYPE_H

typedef enum
{
    #include "CLReflectTypeEnum"
    ,REFL_VOID_PTR
    ,REFL_USERTYPE
    ,REFL_USERTYPE_PTR

} refl_type;

#endif /* end of include guard: API_TYPE_H */
