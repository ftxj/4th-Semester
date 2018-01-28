class Solution {
private:
    string getNum(const string& s, int& begin){
        string num = "";
        while(begin < s.length()){
            if(s[begin] != '+' && s[begin] != '-' 
               && s[begin] != '*' && s[begin] != '/' && s[begin] != '(' && s[begin] != ')'){
                if(s[begin] == ' '){
                    begin++;
                    continue;
                }
                num += s[begin];
                begin++;
            }
            else{
                break;
            }
        }
        return num;
    }
    int toInt(const string& s){
        int num = 0;
        for(auto i : s){
            num = num *10 + i -'0';
        }
        return num;
    }
public:
    int calculate(string s) {
        map<string, int> M;
        M["+"] = 1;M["-"] = 1;M["*"] = 2;M["/"] = 2;
        M["("] = 3;M[")"] = 3;
        stack<string> st;
        vector<string> out;
        int begin = 0;
        while(begin < s.length()){
            if(s[begin] != '+' && s[begin] != '-' && s[begin] != '*' && s[begin] != '/' && s[begin] != '(' && s[begin] != ')'){
                if(s[begin] == ' '){
                    begin++;
                    continue;
                }
                string num = getNum(s, begin);
                out.push_back(num);
            }
            else{
                if(st.empty() || M[st.top()] < M[string(1, s[begin])]){
                    st.push(string(1, s[begin]));
                }
                else{
                    while(!st.empty() && M[st.top()] >= M[string(1, s[begin])]){
                        out.push_back(st.top());
                        st.pop();
                    }
                    st.push(string(1, s[begin]));    
                }
                begin++;
            }
        }
        while(!st.empty()){
            out.push_back(st.top());
            st.pop();
        }
        // for(int i = 0; i < out.size(); ++i){
        //     cout << out[i] << " ";
        // }
        cout << endl;
        stack<int> res;
        for(auto i : out){
            if(i != "+" && i != "-" && i != "*" && i != "/" ){
                res.push(toInt(i));
            }
            else{
                int first = res.top();
                res.pop();
                int second = res.top();
                res.pop();
                if(i == "+"){
                    first = first + second;
                }
                else if(i == "-"){
                    first = second - first;
                }
                else if(i == "*"){
                    first = first * second;
                }
                else if(i == "/"){
                    first = second / first;
                }
                res.push(first);
            }
            //cout << res.top() << endl;
        }
        return res.top();
    }
};

// 7 + 5 * 2 + 3
// 7 5 2 * + 3 +
// 7 + 5 * (2 + 3)
// 7 5 2 3 + * +

// 7 + 5 + 8 * 3
// 7 5 + 8 3 * +