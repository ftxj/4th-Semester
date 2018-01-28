class Solution {
public:
    int maxProfit(vector<int>& prices) {
        pair<int,int> bestbuy = {INT_MAX,0};
        pair<int,int> bestsell = {0,0};
        int res = 0;
        for(int i = 0; i < prices.size(); ++i){
            if(prices[i] < bestbuy.first)
                bestbuy = {prices[i],i};
            if(prices[i] > bestsell.first || bestbuy.second > bestsell.second)
                bestsell = {prices[i],i};
            if(bestsell.second > bestbuy.second)
                res = max(res, bestsell.first - bestbuy.first);
        }
        return res;
    }
};