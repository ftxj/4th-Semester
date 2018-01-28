class Solution {
public:
    double findMaxAverage(vector<int>& nums, int k) {
        double res = 0;
        double current = 0, last = 0;
        int x = 0;
        for(int i = 0; i < nums.size(); ++i){
            if(x < k){
                x++;
                res += nums[i];
                current = res;
                last = res;
            }else{
                current = last - nums[i - k] + nums[i];
                res = max(res, current);
                last = current;
            }
        }
        return res/k;
    }
};