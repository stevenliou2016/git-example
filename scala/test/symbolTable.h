#ifndef _SYMBOLTABLE_H_
#define _SYMBOLTABLE_H_
#include <map>
using namespace std;

extern const int T_S = 4096;

class HashTableEntry {
   public:
      int key;
      int value;
      int type;
      bool isConstant;

      HashTableEntry(int k, int v, int t, bool ic);
};

class HashMapTable {
   private:
      HashTableEntry **t;
   public:
      HashMapTable();

      int HashFunc(int k);

      void Insert(int k, int v, int ty, bool ic);

      int SearchKey(int k);

      void Remove(int k);

      ~HashMapTable();
};


#endif
