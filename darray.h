#pragma once

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <stddef.h>
#include <malloc.h>
#include <string.h>
#include <strings.h>

#define DARRAY_USE(prefix, T) typedef struct prefix##_##T##_darray { \
	size_t length; \
	T array[]; \
} prefix##_##T##_darray_t; \
 \
inline __attribute__((always_inline)) int prefix##_##T##_darray_grow(prefix##_##T##_darray_t **array, size_t count){ \
	*array = (prefix##_##T##_darray_t *)realloc(*array, sizeof(**array) + (((*array)->length + count) * sizeof(T))); \
 \
	if(*array == NULL) \
		return 1; \
 \
	(*array)->length += count; \
	return 0; \
} \
 \
inline __attribute__((always_inline)) int prefix##_##T##_darray_shrink(prefix##_##T##_darray_t **array, size_t count){ \
	*array = (prefix##_##T##_darray_t *)realloc(*array, sizeof(**array) + (((*array)->length - count) * sizeof(T))); \
 \
	if(*array == NULL) \
		return 1; \
 \
	(*array)->length -= count; \
	return 0; \
} \
 \
inline __attribute__((always_inline)) prefix##_##T##_darray_t *prefix##_##T##_darray_new(){ \
	prefix##_##T##_darray_t *ret; \
 \
	ret = (prefix##_##T##_darray_t *)malloc(sizeof(prefix##_##T##_darray_t)); \
 \
	if(ret == NULL) \
		return ret; \
 \
	ret->length = 0; \
	return ret; \
} \
 \
inline __attribute__((always_inline)) int prefix##_##T##_darray_delete(prefix##_##T##_darray_t **array){ \
	if(*array == NULL) \
		return 1; \
 \
	free(*array); \
	*array = 0; \
	return 0; \
} \
 \
inline __attribute__((always_inline)) int prefix##_##T##_darray_add(prefix##_##T##_darray_t **array, T item){ \
	int status; \
 \
	if(*array == NULL) \
		return 1; \
 \
	status = prefix##_##T##_darray_grow(array, 1); \
	if(status != 0) \
		return 1; \
 \
	(*array)->array[(*array)->length - 1] = item; \
	return 0; \
} \
 \
inline __attribute__((always_inline)) int prefix##_##T##_darray_insert(prefix##_##T##_darray_t **array, uintptr_t index, T item){ \
	size_t grow_size; \
	int status; \
 \
	if(*array == NULL) \
		return 1; \
 \
	if(index >= (*array)->length){ \
		grow_size = index - ((*array)->length - 1); \
	} \
	else{ \
		grow_size = 1; \
	} \
	status = prefix##_##T##_darray_grow(array, grow_size); \
	if(status != 0) \
		return 1; \
 \
	memcpy(&(*array)->array[index + 1], &(*array)->array[index], ((*array)->length - 1 - index) * sizeof(T)); \
 \
	(*array)->array[index] = item; \
 \
	return 0; \
} \
 \
inline __attribute__((always_inline)) int prefix##_##T##_darray_remove(prefix##_##T##_darray_t **array, uintptr_t index){ \
	int status; \
 \
	if(*array == NULL) \
		return 1; \
 \
	if(index >= (*array)->length) \
		return 1; \
 \
	memcpy(&(*array)->array[index], &(*array)->array[index + 1], ((*array)->length - 1 - index) * sizeof(T)); \
 \
	status = prefix##_##T##_darray_shrink(array, 1); \
	if(status != 0) \
		return 1; \
 \
	return 0; \
} \
 \
inline __attribute__((always_inline)) int prefix##_##T##_darray_set(prefix##_##T##_darray_t **array, uintptr_t index, T item){ \
	if(*array == NULL) \
		return 1; \
 \
	if(index >= (*array)->length) \
		return 1; \
 \
	(*array)->array[index] = item; \
	return 0; \
} \
 \
inline __attribute__((always_inline)) T *prefix##_##T##_darray_get(prefix##_##T##_darray_t **array, uintptr_t index){ \
	if(*array == NULL) \
		return NULL; \
 \
	if(index >= (*array)->length) \
		return NULL; \
 \
	return &(*array)->array[index]; \
}

