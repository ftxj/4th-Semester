class Solution {
public:
    vector<int> nextGreaterElement(vector<int>& findNums, vector<int>& nums) {
        vector<int> ans;
        stack<int> s;
        unordered_map<int, int> m;
        for(auto &i : nums)
        {
            while(s.size() && s.top() < i)
            {
                m[s.top()] = i;
                s.pop();
            }
            s.push(i);
        }
        for(auto &i : findNums)
        {
            ans.push_back(m.count(i) ? m[i] : -1);
        }
        return ans;
    }
};