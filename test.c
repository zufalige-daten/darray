#include "darray.h"
#include <stdio.h>
#include <stdlib.h>

DARRAY_USE(la_subdep, int);

int main(void){
	la_subdep_int_darray_t *darray;

	darray = la_subdep_int_darray_new();

	la_subdep_int_darray_add(&darray, 0);
	la_subdep_int_darray_add(&darray, 2);
	la_subdep_int_darray_add(&darray, 12863);

	for(int i = 0; i < darray->length; i++){
		printf("%d.\n", *la_subdep_int_darray_get(&darray, i));
	}

	return 0;
}

