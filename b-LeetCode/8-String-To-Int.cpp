#include <iostream>
#include <string>
#include <climits>
using namespace std;
class Solution {
public:
    int myAtoi(string str) {
        long res = 0, indicator = 1;
        if(str.empty()) return 0;
        for(unsigned int i = 0; i != str.length();){
            i = str.find_first_not_of(' ');
            if(str[i] == '-' || str[i] == '+'){
                indicator = (str[i++] == '-') ? -1 : 1;
            }
            while(str[i] >= '0' && str[i] <= '9'){
                res = res * 10 + (str[i++] -'0');
                if(res*indicator >= INT_MAX) return INT_MAX;
                if(res*indicator <= INT_MIN) return INT_MIN;
            }
            return res*indicator;
        }
    }
};

int main(){
    int x = atoi("-2");
    cout << x << endl;
    return 0;
}