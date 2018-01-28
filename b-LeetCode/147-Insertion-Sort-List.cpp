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
    ListNode* insertionSortList(ListNode* head) {
        ListNode res(INT_MIN);
        res.next = head;
        ListNode* my_head = &res;
        while(head)
        {
            ListNode *t = &res;
            ListNode *pre = &res;
            ListNode *x = head->next;
            while(t && head->val >= t->val && t != head)
            {
                
                pre = t;
                t = t ->next;
            }
           if(t != head)
           {
               pre->next = head;
               head->next = t;
               my_head = my_head;
           }
           else
           {
               my_head = head;
           }
           my_head -> next = x;
           head= x;  
        }
        return res.next;
    }
};