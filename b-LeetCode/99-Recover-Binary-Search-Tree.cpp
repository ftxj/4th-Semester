/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode(int x) : val(x), left(NULL), right(NULL) {}
 * };
 */
class Solution {
private:
    TreeNode* node1, * node2;
    int preelm;
    TreeNode* prenode;
    int flag = 0;
    void inorderTravel(TreeNode* p){
        if(p){
            inorderTravel(p->left);
            if(flag){
                if(preelm > p->val && node1 == NULL){
                    node1 = prenode;
                    node2 = p;
                }
                else if(preelm > p->val){
                    node2 = p;
                    return;
                }
                preelm = p->val;
                prenode = p;   
            }
            else{
                preelm = p->val;
                prenode = p; 
                flag = 1;
            }
            inorderTravel(p->right);
        }
    }
public:
    void recoverTree(TreeNode* root) {
        inorderTravel(root);
        int temp = node1->val;
        node1->val = node2->val;
        node2->val = temp;
    }
};