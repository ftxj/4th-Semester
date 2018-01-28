class Solution {
public:
    int largestRectangleArea(vector<int>& heights) {
        stack<pair<int, int>> s;
        heights.push_back(0);
        int max = 0;
        for(int i = 0; i != heights.size(); ++i)
        {
            if(!s.empty() && heights[i] < s.top().second)
            {
                int pre = i;
                while(!s.empty() && heights[i] < s.top().second)
                {
                    int hig = s.top().second;
                    int temp = s.top().first;
                    s.pop(); 
                    int beh = s.empty() ? -1: s.top().first;
                    max = max > hig * (pre - beh - 1) ? max : hig * (pre - beh - 1);
                }   
            }
            s.push({i,heights[i]});
        }
        return max;
    }
};