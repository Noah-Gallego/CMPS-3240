#include <stdio.h>
#include <stdlib.h>

void dgemm( int  length, double *X, double *Y, double *Result ) {
  for (int i = 0; i < length; i++) {
    for (int j = 0; j < length; j++) {
      double sum = 0.0;
      for (int k = 0; k < length; k++) {
        sum += X[i * length + k] * Y[k * length + j];
      }

      Result[i * length + j] = sum;
    }
  }
}

int main(void) {
    const int N = 1024;
    printf("Running DGEMM operation of size %d x %d\n", N, N);
    double *X = (double *) malloc(N * N * sizeof(double));
    double *Y = (double *) malloc(N * N * sizeof(double));
    double *Result = (double *) malloc(N * N * sizeof(double));
    dgemm(N, X, Y, Result);
    free(X);
    free(Y);
    free(Result);
    return 0;
}