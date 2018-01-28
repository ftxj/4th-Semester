class Solution {
public:
    vector<int> nextGreaterElements(vector<int>& nums) {
        stack<pair<int, int>> s;
        vector<int> ans(nums.size(), -1);
        int j = 0;
        for(int i : nums)
        {
            while(s.size() && s.top().second < i)
            {
                ans[s.top().first] = i;
                s.pop();
            }
            s.push({j, i});
            ++j;
        }
        for(int i : nums)
        {
            while(s.top().second < i)
            {
                ans[s.top().first] = i;
                s.pop();
            }
        }
        return ans;
    }
};