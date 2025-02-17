#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <darray.h>

int main(int argc, char **argv){
	darray_t *darray;
	char *command;
	int status, index, data;

	darray = darray_new(sizeof(int));

	while(1){
		printf("[ ");
		for(int i = 0; i < darray->length; i++){
			printf("%d, ", *(int *)darray_get(&darray, i));
		}
		printf("]\n");
		printf("> ");
		scanf("%ms", &command);
		if(strcmp(command, "add") == 0){
			printf("[add].[data].> ");
			scanf("%d", &data);
			status = darray_add(&darray, &data);
			if(status != 0){
				printf("Failure activate.\n");
			}
		}
		else if(strcmp(command, "sub") == 0){
			printf("[sub].[index].> ");
			scanf("%d", &index);
			status = darray_remove(&darray, index);
			if(status != 0){
				printf("Failure activate.\n");
			}
		}
		else if(strcmp(command, "ins") == 0){
			printf("[ins].[index].> ");
			scanf("%d", &index);
			printf("[ins].[data].> ");
			scanf("%d", &data);
			status = darray_insert(&darray, index, &data);
			if(status != 0){
				printf("Failure activate.\n");
			}
		}
		else if(strcmp(command, "set") == 0){
			printf("[set].[index].> ");
			scanf("%d", &index);
			printf("[set].[data].> ");
			scanf("%d", &data);
			status = darray_set(&darray, index, &data);
			if(status != 0){
				printf("Failure activate.\n");
			}
		}
		else{
			printf("Invalid command.\n");
		}
		free(command);
	}

	return 0;
}

