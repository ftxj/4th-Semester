class Solution {
public:
    bool isScramble(string s1, string s2) {
        int len = s1.length();
        bool dp[len+1][len][len];
        for(int i = 0; i < len; ++i){
            for(int j = 0; j < len; ++j){
                dp[1][i][j] = (s1[i] == s2[j])? 1 : 0;
            }
        }
        for(int l = 2; l <= len; ++l){
            for(int i = 0; i <= len - l; ++i){
                for(int j = 0; j <= len - l; ++j){
                    for(int k = 1; k < l; ++k){
                        dp[l][i][j] = dp[k][i][j] & dp[l-k][i + k][j + k];
                        if(dp[l][i][j] == true) break;
                        dp[l][i][j] = dp[k][i][j + l - k] & dp[l-k][i + k][j];
                        if(dp[l][i][j] == true) break;
                    }
                }
            }
        }
        return dp[len][0][0];
    }
};