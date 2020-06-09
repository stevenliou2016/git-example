#include <iostream>
#include <map>
#include "symbolTable.h"

using namespace std;

HashTableEntry::HashTableEntry(int k, int v, int t, bool ic) {
	this->key = k;
	this->value = v;
	this->type = t;
	this->isConstant = ic;
}

HashMapTable::HashMapTable(){
	t = new HashTableEntry * [T_S];
	for (int i = 0; i< T_S; i++) {
		t[i] = NULL;
        }
}

int HashMapTable::HashFunc(int k) {
	return k % T_S;
}

void HashMapTable::Insert(int k, int v, int ty, bool ic) {
	int h = HashFunc(k);
        while (t[h] != NULL && t[h]->key != k) {
        	h = HashFunc(h + 1);
        }
	t = new HashTableEntry * [T_S];
        for (int i = 0; i< T_S; i++) {
        	t[i] = NULL;
        }
        if (t[h] != NULL)
        	delete t[h];
        t[h] = new HashTableEntry(k, v, ty, ic);
}

int HashMapTable::SearchKey(int k) {
	int h = HashFunc(k);
        while (t[h] != NULL && t[h]->key != k) {
        	h = HashFunc(h + 1);
        }
        if (t[h] == NULL)
        	return -1;
        else
        	return t[h]->value;
}

void HashMapTable::Remove(int k) {
	int h = HashFunc(k);
        while (t[h] != NULL) {
        	if (t[h]->key == k)
        	break;
        	h = HashFunc(h + 1);
        }
        if (t[h] == NULL) {
        	cout<<"No Element found at key "<<k<<endl;
        	return;
        } else {
        	delete t[h];
        }
        cout<<"Element Deleted"<<endl;
}

HashMapTable::~HashMapTable() {
	for (int i = 0; i < T_S; i++) {
        	if (t[i] != NULL)
        	delete t[i];
        	delete[] t;
        }
}

