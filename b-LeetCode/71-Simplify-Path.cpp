class Solution {
public:
    string simplifyPath(string path) {
        if(path[path.size()-1]!= '/')
        path = path + "/";
        stack<char> s;
        s.push('/');
        for(char i : path)
        {
            if(i == '/')
            {
                if(s.top() == '.')
                {
                    int i = 0;
                    while(s.top() != '/')
                    {
                        s.pop();
                        i++;
                    }
                    if(i == 2)
                    {   
                        if(s.size() != 1)
                            s.pop();
                        while(s.top() != '/')
                        {
                            s.pop();
                        }
                    }
                }
                else if(s.top() != '/')
                {
                    s.push(i);
                }
            }
            else
            {
                s.push(i);
            }
        }
        if(s.size() != 1 && s.top() == '/')
        {
            s.pop();
        }
        if(s.empty()) s.push('/');
        string ans(s.size(),' ');
        int i = s.size();
        while(i != 0)
        {
            ans[i-1] = s.top();
            s.pop();
            i--;
        }
        if(path.size()>=4 && path[path.size()-4]=='.' &&path[path.size()-3]=='.'&&path[path.size()-2]=='.')
            if(ans.size() > 1) ans += "/..."; else ans += "...";
        return ans;
    }
};