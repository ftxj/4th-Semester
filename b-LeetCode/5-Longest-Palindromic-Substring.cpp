#include <iostream>
#include <string>
using namespace std;
class Solution {
public:
    string longestPalindrome(string s) {
        int n = s.length();
        int max = 0, start = 0, end = 0;
        bool dp1[n][n];
        for(int i = n - 1; i >= 0; --i){
            for(int j = i; j < n; ++j){
                if(i == j) dp[i][j] = true;
                else if(((i + 1 < j - 1) || dp[i + 1][j - 1]) && s[i] == s[j]) dp[i][j] = true;
                else dp[i][j] = false;
                if(dp[i][j]){
                    if(j - i + 1 > max){
                        max = j - i + 1;
                        start = i;
                        end = j;
                    } 
                }
            }
        }
        
        return s.substr(start, end - start + 1);
    }
};

int main(){
    string x = "bb";
    Solution s;
    cout << s.longestPalindrome(x) << endl;
    return 0;
}