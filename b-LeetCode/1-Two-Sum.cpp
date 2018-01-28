class Solution {
public:
    vector<int> twoSum(vector<int>& nums, int target) {
       map<int, pair<int,int>> m;
       for(int i =0; i != nums.size(); i++)
       {
           m[nums[i]] = {i,1};
       }
       for(int i =0; i != nums.size(); i++)
       {
           int j = target - nums[i];
           if(m[j].second == 1 && i!= m[j].first)
           {
               vector<int> v{i,m[j].first};
               return v;
           }
       }
    }
};