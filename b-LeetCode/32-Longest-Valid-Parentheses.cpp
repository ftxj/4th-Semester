class Solution {
public:
    int longestValidParentheses(string s) {
        if(s.length() == 0) return 0;
        int dp[s.length()] = {0};
        int res = 0;
        for(int i = 0; i < s.length(); ++i){
            if(s[i] == '(')
                dp[i] = 0;
            else{
                if(i >= 2 && s[i-1] == '(')
                    dp[i] = dp[i-2] + 2;
                else if(i >= 1 && i >= dp[i-1]+1 && s[i-dp[i-1]-1] == '('){
                    if(i >= dp[i-1]+2)
                        dp[i] = dp[i-1] + 2 + dp[i-dp[i-1]-2];
                    else
                        dp[i] = dp[i-1] + 2;
                }     
                else
                    dp[i] = 0;
                res = max(dp[i], res);
            }
        }
        return res;
    }
};