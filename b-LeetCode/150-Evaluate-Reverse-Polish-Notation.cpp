class Solution {
public:
    int evalRPN(vector<string>& tokens) {
        stack<int> s;
        for(string i : tokens)
        {
           if(i == "+")
           {
               int x = s.top(); s.pop();int y = s.top();s.pop();s.push(x + y);
           }
           else if(i == "-")
           {
               int x = s.top(); s.pop();int y = s.top();s.pop();s.push(y - x);
           }
           else if(i == "*")
           {
               int x = s.top(); s.pop();int y = s.top();s.pop();s.push(x * y);
           }
           else if(i == "/")
           {
               int x = s.top(); s.pop();int y = s.top();s.pop();s.push(y / x);
           }
           else
            {
                s.push(atoi(i.c_str()));
            }
        }
        return s.top();
    }
};