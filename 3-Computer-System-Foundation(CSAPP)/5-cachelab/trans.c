/* 
 * trans.c - Matrix transpose B = A^T
 *
 * Each transpose function must have a prototype of the form:
 * void trans(int M, int N, int A[N][M], int B[M][N]);
 *
 * A transpose function is evaluated by counting the number of misses
 * on a 1KB direct mapped cache with a block size of 32 bytes.
 */ 
#include <stdio.h>
#include "cachelab.h"

int is_transpose(int M, int N, int A[N][M], int B[M][N]);

/* 
 * transpose_submit - This is the solution transpose function that you
 *     will be graded on for Part B of the assignment. Do not change
 *     the description string "Transpose submission", as the driver
 *     searches for that string to identify the transpose function to
 *     be graded. 
 */
char transpose_submit_desc[] = "Transpose submission";
// 按照每次放8个int,至少会有252次miss,此程序miss = 259 很符合最佳.
void transpose_submit(int M, int N, int A[N][M], int B[M][N])
{//划分为块, 8 * 8 的小矩阵转置, 在使用csim观察后发现,B[0][0] 与 A[0][0]的访问会发生冲突,需要独自处理
    int i, j ,k ,l;
    int a0, a1, a2, a3, a4, a5, a6, a7;
    if(N == 32){
        for (i = 0; i < N; i += 8) {
            for (j = 0; j < M; j += 8) {
                if(i == j){   
                    for(k = i; k < i + 8 && k < N; ++k){
                        a0 = A[k][j];
                        a1 = A[k][j + 1];
                        a2 = A[k][j + 2];
                        a3 = A[k][j + 3];
                        a4 = A[k][j + 4];
                        a5 = A[k][j + 5];
                        a6 = A[k][j + 6];
                        a7 = A[k][j + 7];
                        B[k][j] = a0; //保持对缓存友好的操作......
                        B[k][j + 1] = a1;
                        B[k][j + 2] = a2;
                        B[k][j + 3] = a3;
                        B[k][j + 4] = a4;
                        B[k][j + 5] = a5;
                        B[k][j + 6] = a6;
                        B[k][j + 7] = a7;
                    }//结束之后B全部在cache中,这样很方便进行操作,xjb写都不会破坏友好型
                    for(k = i; k < i + 8 && k < N; ++k){
                        for(l = k; l < j + 8 && l < M; ++l){
                            a0 = B[l][k];
                            B[l][k] = B[k][l];
                            B[k][l] = a0;
                        }
                    }
                }
                else{ 
                    for (k = i; k < i + 8 && k < N; k++){
                        for (l = j; l < j + 8 && l < M; l++){
                            B[l][k] = A[k][l];
                        }
                }
                }
            }
        }
    }
    else if(N == 64){
        for (i = 0; i < N; i += 4) {
            for (j = 0; j < M; j += 4) {
                if(i == j){   
                    for(k = i; k < i + 4 && k < N; ++k){
                        a0 = A[k][j];
                        a1 = A[k][j + 1];
                        a2 = A[k][j + 2];
                        a3 = A[k][j + 3];
                        B[k][j] = a0; //保持对缓存友好的操作......
                        B[k][j + 1] = a1;
                        B[k][j + 2] = a2;
                        B[k][j + 3] = a3;
                    }//结束之后B全部在cache中,这样很方便进行操作,xjb写都不会破坏友好型
                    for(k = i; k < i + 4 && k < N; ++k){
                        for(l = k; l < j + 4 && l < M; ++l){
                            a0 = B[l][k];
                            B[l][k] = B[k][l];
                            B[k][l] = a0;
                        }
                    }
                }
                else{
                    for (k = i; k < i + 4 && k < N; k++) {
                        for (l = j; l < j + 4 && l < M; l++) {
                            B[l][k] = A[k][l];
                        }
                    }
                }
		    }
	    }
    }
}

/* 
 * You can define additional transpose functions below. We've defined
 * a simple one below to help you get started. 
 */ 
char trans_simple_desc[] = "Divide Block";
void trans_simple(int M, int N, int A[N][M], int B[M][N])
{
    /* your transpose code here */
    int i, j ,k ,l;
    int a0,a1,a2,a3,a4,a5,a6,a7;
    for (i = 0; i < N; i += 4) {
		for (j = 0; j < M; j += 4) {
			for (k = i; k < i + 4 && k < N; k++) {
				for (l = j; l < j + 4 && l < M; l++) {
					B[l][k] = A[k][l];
				}
			}
		}
	}
}
/* 
 * trans - A simple baseline transpose function, not optimized for the cache.
 */
char trans_desc[] = "Simple row-wise scan transpose";
void trans(int M, int N, int A[N][M], int B[M][N])
{
    int i, j, tmp;

    for (i = 0; i < N; i++) {
        for (j = 0; j < M; j++) {
            tmp = A[i][j];
            B[j][i] = tmp;
        }
    }    

}

/*
 * registerFunctions - This function registers your transpose
 *     functions with the driver.  At runtime, the driver will
 *     evaluate each of the registered functions and summarize their
 *     performance. This is a handy way to experiment with different
 *     transpose strategies.
 */
void registerFunctions()
{
    /* Register your solution function */
    registerTransFunction(transpose_submit, transpose_submit_desc); 
    registerTransFunction(trans_simple, trans_simple_desc);
    /* Register any additional transpose functions */
    registerTransFunction(trans, trans_desc); 

}

/* 
 * is_transpose - This helper function checks if B is the transpose of
 *     A. You can check the correctness of your transpose by calling
 *     it before returning from the transpose function.
 */
int is_transpose(int M, int N, int A[N][M], int B[M][N])
{
    int i, j;

    for (i = 0; i < N; i++) {
        for (j = 0; j < M; ++j) {
            if (A[i][j] != B[j][i]) {
                return 0;
            }
        }
    }
    return 1;
}

