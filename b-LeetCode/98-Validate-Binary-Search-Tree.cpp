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
    int pre;
    int flag = 0;
    bool inorder(TreeNode* p){
        if(!p) return true;
        bool l = inorder(p->left);
        if(flag && p->val <= pre){
            return false;
        }
        if(!flag){
            flag = 1;
        }
        pre = p->val;
        bool r = inorder(p->right);
        return l&r;
    }
public:
    bool isValidBST(TreeNode* root) {
        if(!root) return true;
        return inorder(root);
    }
};