class Solution {
public:
    int maxSubArray(vector<int>& nums) {
        if(nums.size() == 0) return INT_MIN;
        int dp[nums.size()] = {0};
        int res = INT_MIN;
        dp[0] = nums[0];
        res = nums[0];
        for(int i = 1; i < nums.size(); ++i){
            dp[i] = max(dp[i-1]+nums[i], nums[i]);
            res = max(dp[i], res);
        }
        return res;
    }
};