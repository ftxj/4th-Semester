class Solution {
public:
    int numDecodings(string s) {
        int len = s.length();
        if(len == 0) return 0;
        int dp[len];
        int sb[len];
        for(int i = 0; i < len; ++i){
            sb[i] = s[i] - '0';
        }
        dp[0] = sb[0] > 0 ? 1 : 0;
        if(len == 1) return dp[0];
        dp[1] = sb[1] != 0 ? (sb[0] * 10 + sb[1] <= 26 && sb[0] * 10 + sb[1]>= 10 ? dp[0] + 1 : dp[0])
            :(sb[0] * 10 + sb[1] <= 26 && sb[0] * 10 + sb[1]>= 10 ? 1 : 0);
        for(int i = 2; i < len; ++i){
            if(sb[i] == 0 && sb[i] + 10* sb[i-1] <= 26 && sb[i] + 10* sb[i-1] >= 10) dp[i] = dp[i-2];
            else if(sb[i] == 0) dp[i] = 0;
            else dp[i] = dp[i-1] + (sb[i-1] * 10 + sb[i] <= 26 && sb[i-1] * 10 + sb[i]>= 10 ? dp[i-2] : 0);
        }
        return dp[len - 1];
    }
};