class Solution {
public:
    int numTrees(int n) {
        int T[n + 1] = {0};
        T[0] = 1;
        for(int i = 1; i <= n; ++i){
            for(int j = 1; j <= i; ++j){
                T[i] += T[j - 1]* T[i - j]; 
            }
        }
        return T[n];
    }
};