class Solution {
private:
    int getid(string s){return stoi(s.substr(0, s.find_first_of(":")));}
    int gettime(string s){return stoi(s.substr(s.find_last_of(":") + 1, s.size() - s.find_last_of(":") - 1));}
    bool getstate(string s){return s.find_first_of('s') < s.size();}
public:
    vector<int> exclusiveTime(int n, vector<string>& logs) {
        int maxid = 0;
        unordered_map<int, int> res;
        pair<int, int> temp;
        stack<pair<int, int>> Q;
        for(int i = 0; i < logs.size(); ++i){
            int id = getid(logs[i]);
            maxid = max(maxid, id);
            int time = gettime(logs[i]);
            bool state = getstate(logs[i]);
            //cout << "id: " << id << " time: "<<time << " state: "<< state << endl;
            if(state){
                if(!Q.empty()){
                    temp = Q.top();
                    res[temp.first] += time - temp.second;
                    // cout << " true:";
                    // cout <<"    "<< temp.first << " : " << res[temp.first] << endl;
                    temp.second = time;
                    Q.pop();
                    Q.push(temp);
                    Q.push({id, time});
                    if(res.find(id) == res.end())
                    res[id] = 0;
                }
                else{
                    Q.push({id, time});
                    if(res.find(id) == res.end())
                        res[id] = 0;
                }
            }
            else{
                temp = Q.top();
                // cout << " fasle:";
                // cout << "   "<<temp.first << " : " << res[temp.first] << endl;
                res[temp.first] += time - temp.second + 1;
                //cout <<"        "<< temp.first << " : " << res[temp.first] << endl;
                Q.pop();
                if(!Q.empty()){
                    temp = Q.top();
                    temp.second = time + 1;
                    Q.pop();
                    Q.push(temp);
                }
            }
        }
        vector<int> v;
        for(int i = 0; i <= maxid; ++i){
            if(res.find(i) != res.end())
                v.push_back(res[i]);
        }
        return v;
    }
};