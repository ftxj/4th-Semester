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
    string tree2str(TreeNode* t) {
        string ans = "";
        stack<pair<TreeNode*, int>> nodes;
        TreeNode* root = t;
        if(t)
            nodes.push({t,1});
        pair<TreeNode*, int> x;
        while(!nodes.empty()){
            x = nodes.top();
            if(x.second == 0){
                if(x.first != root)
                    ans += ")";
                nodes.pop();
            }else{
                if(x.first != root)
                    ans += "(";
                if(x.first != NULL)
                    ans += to_string(x.first->val);
                x.second--;
                nodes.pop();
                nodes.push(x);
            }
            if(x.first != NULL){
            if(x.first->right != NULL && x.first->left != NULL){
                pair<TreeNode*,int> ne;
                ne.first = x.first->right;
                ne.second = 1;
                nodes.push(ne);
                x.first->right = NULL;
                
                ne.first = x.first->left;
                ne.second = 1;
                nodes.push(ne);
                x.first->left = NULL;
            }else if(x.first->right != NULL){
                pair<TreeNode*,int> ne;
                ne.first = x.first->right;
                ne.second = 1;
                nodes.push(ne);
                x.first->right = NULL;
                
                ne.first = NULL;
                ne.second = 1;
                nodes.push(ne);
                x.first->left = NULL;
            }else if(x.first->left != NULL){
                pair<TreeNode*,int> ne;
                ne.first = x.first->left;
                ne.second = 1;
                nodes.push(ne);
                x.first->left = NULL;
            }
            }
        }
        return ans;
    }
};