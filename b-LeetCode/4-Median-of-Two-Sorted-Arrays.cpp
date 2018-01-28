#include <iostream>
#include <vector>

using namespace std;
class Solution {
public:
    double findMedianSortedArrays(vector<int>& nums1, vector<int>& nums2) {
        int len_1 = nums1.size();
        int len_2 = nums2.size();
        int len = (len_1 + len_2);
        if(len % 2 == 0){
            return (getKth(nums1, 0, len_1, nums2, 0, len_2, len / 2) + getKth(nums1, 0, len_1, nums2, 0, len_2, len / 2 + 1))/ 2.0;   
        }
        else{
            return getKth(nums1, 0, len_1, nums2, 0, len_2, len / 2 + 1);
        }
        
    }
    double getKth(vector<int> nums1, int beg1, int len1, vector<int> nums2, int beg2, int len2, int k){
        if(len1 == 0){
            return nums2[beg2 + k - 1]/1.0;
        }
        else if(len2 == 0){
            return nums1[beg1 + k - 1]/1.0;
        }
        else if(k == 1)
            return min(nums1[beg1], nums2[beg2]);
        if(len1 >= k/2 && len2 >= k/2){
             if(nums1[beg1 + k/2 - 1] >= nums2[beg2 + k/2 - 1]){
                return getKth(nums1, beg1, len1, nums2, beg2 + k/2,len2 - k/2, k - k/2);
            }
            else{
                return getKth(nums1, beg1 + k/2, len1 - k/2, nums2, beg2, len2, k - k/2);
            }
        }
        else{
            if(len1 > len2){
                if(nums1[beg1 + k/2 - 1] >=  nums2[beg2 + len2 - 1]){
                    return getKth(nums1, beg1, len1, nums2, beg2 + len2 - 1, 0,  k - len2);
                }
                else{
                    return getKth(nums1, beg1 + k/2, len1 - k/2, nums2, beg2, len2,  k - k/2);
                }
            }
            else{
                if(nums2[beg2 + k/2 - 1] >=  nums1[beg1 + len1 - 1]){
                    return getKth(nums1, beg1 + len1 - 1, 0, nums2, beg2, len2,  k - len1);
                }
                else{
                    return getKth(nums1, beg1, len1, nums2, beg2+k/2, len2 - k/2, k - k/2);
                }
            }
        }
    }
};

int main(){
    vector<int> v1={1};
    vector<int> v2={2, 3};
    Solution S;
    cout << S.findMedianSortedArrays(v1, v2) << endl;
    return 0;
}


