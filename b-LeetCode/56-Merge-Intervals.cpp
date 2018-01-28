/**
 * Definition for an interval.
 * struct Interval {
 *     int start;
 *     int end;
 *     Interval() : start(0), end(0) {}
 *     Interval(int s, int e) : start(s), end(e) {}
 * };
 */
class Solution {
public:
    vector<Interval> merge(vector<Interval>& intervals) {
        int max = 0;
        vector<Interval> res;
        for(auto &i : intervals)
        {
            max = max >= i.end ? max : i.end;
        }
        vector<pair<int,int>> v(max + 1,{0,0});
        
        for(auto &i : intervals)
        {
            if(i.start == i.end)
                v[i.start].second = 1;
            --(v[i.start].first);
            ++(v[i.end].first);
        }
        int num = 0;
        for(int i = 0; i <= max; ++i)
        {
            if(v[i].first < 0)
            {
                int temp = v[i].first;
                if(num != 0)
                   v[i].first = 0;
                num += temp;
            }
            else if(v[i].first > 0)
            {
                num += v[i].first;
                if(num != 0)
                {
                    v[i].first = 0;
                }
            }
        }
        int start = -1;
        for(int i = 0; i <= max; ++i)
        {
            if(v[i].first < 0)
                start = i;
            else if(v[i].first > 0)
            {
                Interval x(start,i);
                res.push_back(x);
                start = -1;
            }
            else if(start < 0 && v[i].second == 1)
            {
                Interval x(i,i);
                res.push_back(x);
            }
        }
        return res;
    }
};