// Matrix Multiplier

#include <stdio.h>

const long long int M = 2, N = 3, P = 2;

void mm_c(long long int A[M][N], long long int B[N][P], long long int C[M][P],
          long long int M, long long int N, long long int P) {
  long long int i, j, k;
  long long int temp;

  for (k = 0; k < P; k++)
    for (i = 0; i < M; i++) {
      temp = 0;
      for (j = 0; j < N; j++) {
        temp = A[i][j] * B[j][k] + temp;
      }
      C[i][k] = temp;
    }
}

int main() {
  long long int A[2][3] = {{1, 2, 3}, {4, 5, 6}};
  long long int B[3][2] = {{7, 1}, {8, 1}, {9, 1}};
  long long int Casm[2][2] = {{0, 0}, {0, 0}};

  mm_c(A, B, Casm, M, N, P);

  printf("Casm[0] = %lld \n", Casm[0][0]);
  printf("Casm[1] = %lld \n", Casm[0][1]);
  printf("Casm[2] = %lld \n", Casm[1][0]);
  printf("Casm[3] = %lld \n", Casm[1][1]);
}
