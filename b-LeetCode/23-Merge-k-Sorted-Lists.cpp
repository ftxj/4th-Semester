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
    ListNode* mergeKLists(vector<ListNode*>& lists) {
        ListNode* res = NULL;
        ListNode* curr = res;
        ListNode* next;
        pair<int, ListNode*> thisMin;
        auto cmp = [](pair<int,ListNode*> a, pair<int,ListNode*> b){return a.first > b.first;};
        priority_queue<pair<int, ListNode*>, vector<pair<int, ListNode*>>, decltype(cmp)> Q(cmp);
        for(int i = 0; i < lists.size(); ++i){
            if(lists[i])
                Q.push(make_pair(lists[i]->val, lists[i]));
        }
        while(!Q.empty()){
            thisMin = Q.top();
            next = thisMin.second->next;
            Q.pop();
            if(next != NULL){
                Q.push({next->val, next});
            }
            if(res == NULL){
                res = thisMin.second;
                curr = res;
            }
            else{
                curr->next = thisMin.second;
                curr = curr->next;
            }
        }
        return res;
    }
};