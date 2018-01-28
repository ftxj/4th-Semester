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
    vector<vector<int>> zigzagLevelOrder(TreeNode* root) {
        vector<vector<int>> res;
        bool flag = 1;
        stack<TreeNode*> next;
        if(root) next.push(root);
        while(!next.empty())
        {
            vector<TreeNode*> temp;
            vector<int> res1;
            while(!next.empty())
            {
                temp.push_back(next.top());
                res1.push_back(next.top()->val);
                next.pop();
            }
            res.push_back(res1);
            for(int i = 0; i != temp.size(); ++i)
            {
                if(flag == 1)
                {
                    if(temp[i]->left) next.push(temp[i]->left);
                    if(temp[i]->right) next.push(temp[i]->right); 
                }
                else
                {
                    if(temp[i]->right) next.push(temp[i]->right);
                    if(temp[i]->left) next.push(temp[i]->left);
                }
            }
            flag = !flag;
        }
        return res;
    }
};