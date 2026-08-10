#include <stdio.h> 
#include <stdlib.h> 

void fdot( int length, float *X, float *Y) {
  float sum = 0;
  for (int i = 0; i < length; i++ ) {
    sum += X[i] * Y[i];
  }
}

int main(void) {
    const int N = 200000000;
    printf("Running FDOT operation of size %d x 1\n", N);
    float *X = (float *) malloc(N * sizeof(float));
    float *Y = (float *) malloc(N * sizeof(float));
    fdot(N, X, Y);
    free(X);
    free(Y);
    return 0;
}