/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode(int x) : val(x), next(NULL) {}
 * };
 */
class Solution {
public:
    ListNode* addTwoNumbers(ListNode* l1, ListNode* l2) {
        ListNode res(0);
        ListNode* rel = &res;
        int cuu = 0;
        while(l1 || l2 || cuu)
        {
            int reg = (l1 ? l1->val : 0) +(l2 ? l2->val : 0)  + cuu;
            cuu = reg / 10;
            rel->next = new ListNode(reg%10);
            rel = rel->next;
            l1 = l1 ? l1->next : l1;
            l2 = l2 ? l2->next : l2;
        }
        return res.next;
    }
};