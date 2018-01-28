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
    int num;
    int ii;
public:
    int pathSum(TreeNode* root, int sum) {
        TreeNode* r = root;
        int res = 0;
        int** ok = nullptr;
        int** dp = nullptr;
        int** san = nullptr;
        int*  max = nullptr;
        int*  fa = nullptr;
        int*  W = nullptr;
        num = 0;
        ii = 0;
        midTravl(root);
        fa = new int [num + 1];
        W  = new int [num + 1];
        ok = new int*[num + 1];
        san= new int*[num + 1];
        max= new int [num + 1];
        dp = new int*[num + 1];

        for(int i = 0; i < num + 1; ++i){
            dp[i] = new int [num + 1];
        }

        for(int i = 0; i < num + 1; ++i){
            ok[i] = new int [num + 1];
            san[i]= new int [2];
        }

        for(int i = 0; i < num + 1; ++i){
            for(int j = 0; j < num + 1; ++j){
                ok[i][j] = 0;
            }
        }

        getID(r, 0, fa, san, W);
        max[0] = num + 1;
        for(int i = 1; i < num; ++i){
            if(i == san[fa[i]][1]){
                max[i] = max[fa[i]];
            }else{
                max[i] = san[fa[i]][1] == -1? max[fa[i]] : san[fa[i]][1];
            }
        }
        for(int i = 0; i < num; ++i){
            ok[i][i] = 1;
            for(int j = i; j < max[i] && max[i] != -1; ++j){
                ok[i][j] = 1;
            }
        }
        for(int i = 0; i < num; ++i){
            for(int j = 0; j < num; ++j){
                dp[i][j] = 0;   
            }
        }
        for(int i = 0; i < num; ++i){
            for(int j = i; j < num; ++j){
                if(i == j) {
                    dp[i][i] = sum - W[i];
                }
                else{
                    dp[i][j] = dp[i][fa[j]] - W[j];
                }
            }
        }
        
        for(int i = 0; i < num; ++i){
            for(int j = i; j < num; ++j){
                if(dp[i][j] == 0 && ok[i][j] == 1){
                    res++;
                }
            }
        }
        for(int i = 0; i < num; ++i){
            delete [] dp[i];
        }
        delete [] dp;
        dp = NULL;
        
        for(int i = 0; i < num; ++i){
            delete [] ok[i];
        }
        delete [] ok;
        ok = NULL;
        
        for(int i = 0; i < num; ++i){
            delete [] san[i];
        }
        delete [] san;
        
        delete[] max;
        delete[] fa;
        delete[] W;
        return res;
    }
    void midTravl(TreeNode* root){
        if(root == NULL){
            return;
        }
        num++;
        midTravl(root->left);
        midTravl(root->right);
    }
    void getID(TreeNode* root, int fid, int* fa,int** san, int* W){
        if(root == NULL){
            return;
        }
        int x = ii;
        fa[x] = fid;
        W[x] = root -> val;
        ii++;
        if(root->left != NULL)
            san[x][0] = ii;
        else
            san[x][0] = -1;
        getID(root->left, x, fa, san, W);
        if(root->right != NULL)
            san[x][1] = ii;
        else
            san[x][1] = -1;
        getID(root->right, x, fa, san, W);
    }
};