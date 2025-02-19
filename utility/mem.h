/***********************************************************************
 Freeciv - Copyright (C) 1996 - A Kjeldberg, L Gregersen, P Unold
   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
***********************************************************************/

#ifndef FC__MEM_H
#define FC__MEM_H

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */

#include <stdlib.h>             /* size_t; actually stddef.h, but stdlib.h
                                 * might be more reliable? --dwp */

/* utility */
#include "log.h"
#include "support.h"            /* fc__warn_unused_result */

/* fc_malloc, fc_realloc, fc_calloc:
 * fc_ stands for freeciv; the return value is checked,
 * and freeciv-specific processing occurs if it is NULL:
 * a log message, possibly cleanup, and ending with exit(1)
 */

#define fc_malloc(sz)      fc_real_malloc((sz), "malloc", \
                                          __FC_LINE__, __FILE__)
#define fc_realloc(ptr,sz) fc_real_realloc((ptr), (sz), "realloc", \
                                           __FC_LINE__, __FILE__)
#define fc_calloc(n,esz)   fc_real_calloc((n), (esz), "calloc", \
                                          __FC_LINE__, __FILE__)

#define FC_FREE(ptr)       do { free(ptr); (ptr) = NULL; } while (FALSE)

#define fc_strdup(str) real_fc_strdup((str), "strdup", __FC_LINE__, __FILE__)

/***********************************************************************/

/* You shouldn't call these functions directly;
 * use the macros above instead.
 */
void *fc_real_malloc(size_t size,
                     const char *called_as, int line, const char *file)
                     fc__warn_unused_result;
void *fc_real_realloc(void *ptr, size_t size,
                      const char *called_as, int line, const char *file)
                      fc__warn_unused_result;
void *fc_real_calloc(size_t nelem, size_t elsize,
                     const char *called_as, int line, const char *file)
                     fc__warn_unused_result;

char *real_fc_strdup(const char *str,
                     const char *called_as, int line, const char *file)
                     fc__warn_unused_result;

#define hh_malloc malloc
#define hh_calloc calloc

#ifdef __cplusplus
}
#endif /* __cplusplus */

#endif /* FC__MEM_H */
