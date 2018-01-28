class Solution {
    // dp[j] = 2*dp[j-2] + dp[j-1];
public:
    int climbStairs(int n) {
        if(n == 1 || n == 0)
            return 1;
        int dp[n + 1];
        dp[0] = 0;
        dp[1] = 1;
        dp[2] = 2;
        for(int i = 3; i <= n; ++i){
            dp[i] = dp[i-2] + dp[i-1];
        }
        return dp[n];
    }
};