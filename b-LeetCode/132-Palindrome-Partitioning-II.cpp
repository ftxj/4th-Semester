class Solution {
public:
    int minCut(string s) {
        int len = s.length();
        if(len == 0) return 0;
        bool isPalindrome[len][len];
        int bestcut[len];
        for(int i = len - 1; i >= 0; --i){
            for(int j = i; j < len; ++j){
                if(i == j){
                   isPalindrome[i][j] = true; 
                }
                else if(i + 1 > j - 1){
                    isPalindrome[i][j] = (s[i] == s[j]);
                }
                else{
                    isPalindrome[i][j] = (s[i] == s[j]) & isPalindrome[i + 1][j - 1];
                }
            }
        }
        for(int i = 0; i < len; ++i){
            int temp = i + 1;
            for(int j = 0; j <= i; ++j){
                if(isPalindrome[j][i]){
                    if(j != 0)
                        temp = min(temp, bestcut[j - 1] + 1);
                    else
                        temp = min(temp, 1);
                }
            }
            bestcut[i] = temp;
        }
        return bestcut[len - 1] - 1;
    }
};