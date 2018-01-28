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
    vector<TreeNode*> generateTrees(int n) {
        return getTree(1, n+1);
    }
    vector<TreeNode*> getTree(int start, int end){
        vector<TreeNode*> ret;
        if(start >= end)
            return ret;
        vector<TreeNode*> leftV;
        vector<TreeNode*> rightV;
        for(int i = start; i < end; ++i){
            leftV = getTree(start, i);
            rightV = getTree(i+1, end);
            if(leftV.size() != 0 && rightV.size() != 0){
                for(int k = 0; k < leftV.size(); ++k){
                    for(int l = 0; l < rightV.size(); ++l){
                        TreeNode* r = new TreeNode(i);
                        r->left = leftV[k];
                        r->right = rightV[l];
                        ret.push_back(r);
                    }
                }
            }
            else if(leftV.size() != 0){
                for(int l = 0; l < leftV.size(); ++l){
                    TreeNode* r = new TreeNode(i);
                    r->left = leftV[l];
                    r->right = NULL;
                    ret.push_back(r);
                }
            }
            else if(rightV.size() != 0){
                for(int l = 0; l < rightV.size(); ++l){
                    TreeNode* r = new TreeNode(i);
                    r->left = NULL;
                    r->right = rightV[l];
                    ret.push_back(r);
                }
            }
            else{
                TreeNode* r = new TreeNode(i);
                r->left = NULL;
                r->right = NULL;
                ret.push_back(r);
            }
        }
        return ret;
    }
};