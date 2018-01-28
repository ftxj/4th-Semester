#include <iostream>
#include <string>
using namespace std;

class Solution {
public:
    string convert(string s, int numRows) {
        string s1 = "";
        string s2 = "";
        string s3 = "";
        for(unsigned int i = 0; i < s.length(); ++i){
            if(i % 4 == 0) s1.push_back(s[i]);
            if(i % 4 == 1) s2.push_back(s[i]);
            if(i % 4 == 2) s3.push_back(s[i]);
            if(i % 4 == 3) s2.push_back(s[i]);
        } 
        return (s1 + s2 +s3);
    }
};

int main(){
    string x = "PAYPALISHIRING";
    Solution s;
    cout << s.convert(x, 3) << endl;
    return 0;
}