/**
 *   T = O(n)  S = O(1)
 *   Morris Traversal
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode(int x) : val(x), left(NULL), right(NULL) {}
 * };
 */
class Solution {
public:
    vector<int> inorderTraversal(TreeNode* root) {
        TreeNode* p = root;
        TreeNode* decesser = NULL;
        vector<int> ans;
        int i = 0;
        while(p){
            if(p->left){
                decesser = p->left;
                while(decesser->right && decesser->right != p){
                    decesser = decesser->right;
                }
                if(decesser->right == NULL){
                    decesser->right = p;
                    p = p->left;
                }else{
                    decesser->right = NULL;
                    ans.push_back(p->val);
                    p = p ->right;
                }
            }else{
                ans.push_back(p->val);
                p = p -> right;
            }
        }
        return ans;
    }
};