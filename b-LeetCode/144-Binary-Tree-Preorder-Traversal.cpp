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
    vector<int> preorderTraversal(TreeNode* root) {
        TreeNode* p = root;
        stack<TreeNode *> s;
        vector<int> v;
        while(p)
        {
            if(p->right) s.push(p->right);
            if(p->left) s.push(p->left);
            s.push(p);
            if(!s.empty())
            {
                v.push_back(s.top()->val);
                s.pop();
                if(!s.empty())
                {
                    p = s.top();
                    s.pop();   
                }
                else
                {
                    break;
                }
            }
        }
        return v;
    }
};