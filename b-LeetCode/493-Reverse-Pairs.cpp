class Solution {
private:
    const bool RED = 1;
    const bool BLACK = 0;
    struct node{
        long long elm;
        int bigger;
        bool color;
        node* right;
        node* left;
        node* p;
    };
    node* root;
    node* nil;
    void _Rb_tree_leftrotate(node* x){
        node* y = x->right;
        x->bigger = x->bigger - y->bigger - 1;
        x->right = y->left;
        if(y ->left != nil){
            (y->left)->p = x;
        }
        y->p = x->p;
        if(x->p == nil){
            root = y;
        }else if(x == (x->p)->left){
            (x->p)->left = y;
        }else{
            (x->p)->right= y;
        }
        y->left = x;
        x->p = y;
    }
    void _Rb_tree_rightrotate(node* x){
        node* y = x -> left;
        y->bigger = x->bigger + y->bigger + 1;
        x->left = y->right;
        if(y->right != nil){
            (y->right)->p = x;
        }
        y->p = x->p;
        if(x->p == nil){
            root = y;
        }else if(x == (x->p)->left){
            (x->p)->left = y;
        }else{
            (x->p)->right = y;
        }
        y->right = x;
        x->p = y;
    }
    void _Rb_tree_insert_rebalance(node* nobalancenode){
        node* current = nobalancenode;
        while((current ->p)->color == RED){
            if(current->p == ((current->p)->p)->left){
                node* uncle =((current->p)->p)->right;
                node* grandpa=(current->p)->p;
                node* father=(current)->p;
                if(uncle->color == RED){
                    father->color = BLACK;
                    uncle->color = BLACK;
                    grandpa->color=RED;
                    current = grandpa;
                }else{
                    if(father->right == current){
                        _Rb_tree_leftrotate(father);
                        current = father;
                        father = current->p;
                    }
                    father->color = BLACK;
                    grandpa->color= RED;
                    _Rb_tree_rightrotate(grandpa);
                }
            }else{
                node* uncle = ((current->p)->p)->left;
                node* grandpa=(current->p)->p;
                node* father=(current)->p;
                if(uncle->color == RED){
                    father->color = BLACK;
                    uncle ->color = BLACK;
                    grandpa->color= RED;
                    current = grandpa;
                }else{
                    if(current == father->left){
                        current = father;
                        _Rb_tree_rightrotate(current);
                        father = current ->p;
                    }
                    father->color = BLACK;
                    grandpa->color =RED;
                    _Rb_tree_leftrotate(grandpa);
                }
            }
        }
        root->color = BLACK;
    }    
    void insert(node* x){
        node* iter = root;
        node* father = nil;
        while(iter != nil){
            father = iter;
            if(iter->elm > x->elm){
                iter = iter -> left;// small insert left
            }else{
                iter->bigger += 1;
                iter = iter -> right;// big insert right
            }
        }
        x ->p = father;
        if(father == nil){
            root = x;
        }else if(father->elm > x->elm ){
            father ->left = x;
        }else{
            father ->right = x;
        }
        x -> left = nil;
        x -> right = nil;
        x -> color = RED;
        _Rb_tree_insert_rebalance(x);
    }

public:
    int reversePairs(vector<int>& nums) {
        nil = new node [1];
        root = nil;
        nil->p = root;
        nil->color = BLACK;
        int count = 0;
        int sizeN = nums.size();
        for(int i = 0; i < sizeN; ++i){
            long long nn = nums[i];
            node* fuck = root;
            while(fuck!=nil){
               if(fuck->elm > 2 * nn){
                   count += fuck->bigger + 1;
                   fuck = fuck ->left;
               }else{
                   fuck = fuck -> right;
               }
            }
            node* x = new node [1];
            x->elm = nn;
            x->bigger = 0;
            x->left = nil;
            x->right = nil;
            x->p = nil;
            node* iter = root;
            node* father = nil;
            insert(x);
        }
        return count;
    }
};