#include <stdio.h>

void OrdenElem(int *array, int n){
    
    for(int i=0; i<n; i++){
        int menor, endereco;

        menor = array[i];
        endereco = i;
        for(int j=(i+1); j<n; j++){
            if(array[j]<menor){
                menor = array[j];
                endereco = j;
            }else if(array[j] == menor){
                menor = array[j];
                endereco = j;
                break;
            }
        }
        array[endereco] = array[i];
        array[i] = menor;
    }
}

int main (){

    int vetor[100] = {78,27,7,53,3,1,4,10,59,15,48,31,55,14,2,7,92,10,44,61,83,70,3,67,1,26,37,78,87,10,10,65,37,16,17,19,17,30,29,75,45,77,6,99,90,8,6,82,17,49,2,100,19,45,67,19,71,4,97,57,13,6,22,49,21,38,68,37,68,97,12,12,73,18,11,63,25,16,45,42,65,86,41,84,31,7,3,1,11,99,58,23,5,79,72,26,17,40,62,85,};
    int n = 100;

    OrdenElem(vetor, n);

    for(int i=0; i<n; i++) printf("%d,", vetor[i]);

    return 0;
}