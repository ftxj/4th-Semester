/**
 * Definition for binary tree
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode(int x) : val(x), left(NULL), right(NULL) {}
 * };
 */
class BSTIterator {
    private:
    stack<TreeNode *> s;
public:
    BSTIterator(TreeNode *root) {
        TreeNode *p = root;
        while(p)
        {
            s.push(p);
            p = p->left;
        }
    }

    /** @return whether we have a next smallest number */
    bool hasNext() {
        if (s.empty())
            return false;
        return true;
    }

    /** @return the next smallest number */
    int next() {
       TreeNode *pp = s.top();
       TreeNode *p = pp;
       s.pop();
       if(p->right)
       {
           p = p->right;
           while(p)
           {
               s.push(p);
               p = p->left;
           }
       }
       return pp->val;
    }
};
