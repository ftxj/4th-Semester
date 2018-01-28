class Solution {
public:
    bool canJump(vector<int>& nums) {
        if(nums.size() == 1) return true;
        for(int i = 0; i < nums.size();){
            for(int j = i; j <= i + nums[i]; ++j){
                if(j + 1 == nums.size())
                    return true;
                if(j >= nums.size())
                    return false;
                if(j + nums[j] > i + nums[i]){
                    i = j;
                    break;   
                }
                if(j == i + nums[i]){
                    i += nums[i];
                    break;
                }
            }
            if(nums[i] == 0)
                return false;
        }
        return false;
    }
};