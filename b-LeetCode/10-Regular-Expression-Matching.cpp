#include <iostream>
#include <string>
using namespace std;

class Solution {
public:
    bool isMatch(string s, string p) {
        return temp(s,0,p,0);
    }
    bool temp(string s, int i, string p, int j){
        if(i == s.length()){
            if(j == p.length()) return true;
            if(j <= (p.length() - 2) && p[j+1] == '*') return temp(s, i, p, j+2);
            return false;
        }
        if(j == p.length() && i < s.length()) return false;
        if(p.length() >= j+1 && p[j + 1] == '*'){
            if(s[i] == p[j] || p[j] == '.')
                return temp(s, i, p, j+2) || temp(s, i+1, p, j);
            else
                return temp(s, i, p, j+2);
        }
        else{
            if(s[i] == p[j] || p[j] == '.')
                return temp(s, i+1, p, j+1);
            else
                return false;
        }
    }
};

int main(){

    return 0;
}