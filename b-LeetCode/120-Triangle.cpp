class Solution {
public:
    int minimumTotal(vector<vector<int>>& triangle) {
        int m = triangle.size();
        int n = triangle[m-1].size();
        int dp[m][n];
        dp[0][0] = triangle[0][0];
        for(int i = 1; i < m; ++i){
            for(int j = 0; j < triangle[i].size(); ++j){
                if(j == 0)
                    dp[i][j] = dp[i-1][j] + triangle[i][j];
                else if(j == triangle[i].size() - 1)
                    dp[i][j] = dp[i-1][j-1] + triangle[i][j];
                else
                    dp[i][j] = min(dp[i-1][j], dp[i-1][j-1]) + triangle[i][j];
                
            }
        }
        int res = INT_MAX;
        for(int i = 0; i < n; ++i){
            res = min(res, dp[m-1][i]);
        }
        return res;
    }
};