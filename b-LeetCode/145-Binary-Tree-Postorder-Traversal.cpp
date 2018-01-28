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
public:
    vector<int> postorderTraversal(TreeNode* root) {
        TreeNode* p = root;
        stack<TreeNode *> s;
        vector<int> v;
        while(p)
        {
            s.push(p);
            if(p->right) {s.push(p->right); p->right = NULL;}
            if(p->left) {s.push(p->left); p->left = NULL;}
            if(p == s.top()) 
            {
                v.push_back(p->val);
                s.pop();
                if(s.empty()) break;
                p = s.top();   
                s.pop();
            }
            else
            {
                p = s.top();
                s.pop();
            }
        }
        
        return v;
    }
};