#include <iostream>
#include <string>
using namespace std;

class Solution {
public:
    bool isPalindrome(int x) {
        int r = 0, d = x;
        while(d > 0){
            r = r * 10 + d % 10;
            d = d /10;
        }
        return x == r;
    }
};

int main(){
    return 0;
}