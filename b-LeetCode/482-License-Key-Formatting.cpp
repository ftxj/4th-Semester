class Solution {
public:
    string licenseKeyFormatting(string S, int K) {
        string res;
        size_t num = 0;
        for(auto i : S){
            if(i != '-')
                num++;
        }
        int first = num % K ;
        int group = num / K  + (first > 0 ? 1 : 0);
        first = (first == 0)? K : first;
        int c = 0;
        for(auto i : S){
            if(i != '-'){
                if(i >= 'a' && i <= 'z'){
                    i = i - 'a' + 'A';
                }
                c++;
                if(c == K || c == first){
                    res += i;
                    res += '-';
                    c = 0;
                    first = K;
                }
                else{
                    res += i;
                }
            }
        }
        res.erase(res.end() - 1);
        return res;
    }
};