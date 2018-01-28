class Solution {
public:
    int lengthOfLongestSubstring(string s) {
        unordered_map<char, int> m;
        if(s.empty()) return 0;
        int max = 0;
        int str = 0;
        int length =0;
        for(int i = 0; i != s.size(); ++i)
        {
            if(m.find(s[i]) == m.end()) length++;
            else if(m[s[i]] < str) length++;
            else
            {
                int pre = m[s[i]];
                str = pre + 1;
                length = i - str + 1;
                max = max > length ? max : length;
            }
            m[s[i]] = i;
            max = max > length ? max : length;
           // cout << "start from " << str <<" end "<< i <<  " max = " <<max << endl;
        }
        return max;
    }
};