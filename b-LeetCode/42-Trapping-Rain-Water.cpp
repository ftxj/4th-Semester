class Solution {
public:
        int trap(vector<int>& height) {
        stack<pair<int, int>> s;
        int ans = 0;
        for(int i = 0; !height.empty()&&i != height.size(); ++i)
        {
            while(!s.empty() && height[i] > s.top().second)
            {
                auto t = s.top();
                s.pop();
                if(!s.empty() && s.top().second <= height[i])
                {
                    ans += (s.top().second - t.second) * (i - s.top().first - 1);
                    //cout << "left: (" << s.top().second << "-" << t.second <<
                   // ") * (" << i <<"-" << s.top().first <<"- 1) = "<< ans << endl;
                }
                else if(!s.empty() && s.top().second > height[i])
                {
                    ans += (height[i] - t.second) * (i - s.top().first - 1);
                    // cout << "right: " << ans << endl;
                }
            }
            s.push({i,height[i]});
           // cout << ans << "   " << height[i] <<  endl;
        }
        return ans;
    }
};