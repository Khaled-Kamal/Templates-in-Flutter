// 1
#include "bits/stdc++.h"

using namespace std;

#define ll long long

int main() {
  ios_base::sync_with_stdio(false);
  cin.tie(NULL);

	int t; cin >> t;
	while (t--) {
	
		int n; cin >> n;

		if (n % 2) {
			cout << 0 << "\n";
			continue;
		}

		int lo = 0, hi = (n / 4);
		cout << (hi - lo + 1) << "\n";

	}
  
}



// 2

#include "bits/stdc++.h"

using namespace std;

#define ll long long

int main() {
  ios_base::sync_with_stdio(false);
  cin.tie(NULL);

	int t; cin >> t;
	while (t--) {
	
		int n; cin >> n;
		vector<int> a(n);
		for (int &i : a) {
			cin >> i;
		}

		if (a[0] == -1 && a.back() == -1) {
			a[0] = 0;
			a.back() = 0;
		}
		else if (a[0] == -1) {
			a[0] = a.back();
		}
		else if (a.back() == -1) {
			a.back() = a[0];
		}

		cout << abs(a.back() - a[0]) << "\n";
		for (int i = 0; i < n; i++) {
			if (a[i] == -1) a[i] = 0;
			cout << a[i] << " \n"[i == n - 1];
		}

	}
  
}

// 3

#include "bits/stdc++.h"

using namespace std;

#define ll long long

int main() {
  ios_base::sync_with_stdio(false);
  cin.tie(NULL);

	int t; cin >> t;
	while (t--) {
	
		int n; cin >> n;

		vector<int> a(n), b(n);

		int tot = 0;
		for (int &i : a) {
			cin >> i;
			tot ^= i;
		}
		for (int &i : b) {
			cin >> i;
			tot ^= i;
		}

		if (tot == 0) {
			cout << "Tie\n";
			continue;
		}

		int ok;
		for (int i = n - 1; i >= 0; i--) {
			if (a[i] ^ b[i]) {
				ok = i % 2;
				break;
			}
		}

		cout << (ok ? "Mai" : "Ajisai") << "\n";

	}
  
}


// 4
#include "bits/stdc++.h"

using namespace std;

#define ll long long

int main() {
  ios_base::sync_with_stdio(false);
  cin.tie(NULL);

	int t; cin >> t;
	while (t--) {
	
		int n; cin >> n;

		vector<int> a(n), b(n);

		int tot = 0;
		for (int &i : a) {
			cin >> i;
			tot ^= i;
		}
		for (int &i : b) {
			cin >> i;
			tot ^= i;
		}

		if (tot == 0) {
			cout << "Tie\n";
			continue;
		}

		int hsb = 31 - __builtin_clz(tot);

		int ok;
		for (int i = n - 1; i >= 0; i--) {
			if ((a[i] ^ b[i]) & (1 << hsb)) {
				ok = i % 2;
				break;
			}
		}

		cout << (ok ? "Mai" : "Ajisai") << "\n";

	}
  
}


// 5
#include "bits/stdc++.h"

using namespace std;

#define ll long long

int main() {
  ios_base::sync_with_stdio(false);
  cin.tie(NULL);

	int t; cin >> t;
	while (t--) {
	
		int n; cin >> n;

		vector<int> p(n);
	
		vector<int> ccs;

		for (int &i : p) {
			cin >> i;

			int cur_lo = i;
			while (ccs.size() && ccs.back() < i) {
				cur_lo = min(cur_lo, ccs.back());
				ccs.pop_back();
			}

			ccs.push_back(cur_lo);

		}

		cout << (ccs.size() == 1 ? "Yes" : "No") << "\n";

	}
  
}


// 6
#include "bits/stdc++.h"

using namespace std;

#define ll long long

vector<int> solve(int n) {
	
	vector<int> a(n + 1);

	vector<vector<int>> v(n + 1);
	for (int i = 2; i * i <= n; i++) {
		if (a[i]) continue;
		for (int j = i; j <= n; j += i) {
			if (a[j]) continue;
			v[i].push_back(j);
			a[j] = 1;
		}
		assert(v[i].size() >= 2);
	}

	vector<int> extra;
	for (int i = 1; i <= n; i++) {
		if (!a[i]) {
			extra.push_back(i);
		}
	}

	int can_fit = 0;
	for (auto vv : v) {
		if (vv.size() >= 4) {
			can_fit += (vv.size() - 2) / 2;
		}
	}

	vector<int> ans;
	for (auto &vv : v) {

		reverse(vv.begin(), vv.end());
		while (vv.size() >= 4) {
		
			for (int it = 0; it < 2; it++) {
				ans.push_back(vv.back());
				vv.pop_back();
			}

			if (extra.size()) {
				ans.push_back(extra.back());
				extra.pop_back();
			}

		}
		while (vv.size()) {
			ans.push_back(vv.back());
			vv.pop_back();
		}

	}

	assert(extra.size() <= 6);
	for (int x : extra)
		ans.push_back(x);

	return ans;


}

int main() {
  ios_base::sync_with_stdio(false);
  cin.tie(NULL);

	int t; cin >> t;
	while (t--) {
	
		int n; cin >> n;

		vector<int> ans = solve(n);

		int bad = 0;
		assert(ans.size() == n);
		vector<int> perm(n);
		iota(perm.begin(), perm.end(), 1);
		vector<int> tmp = ans;
		sort(tmp.begin(), tmp.end());
		assert(perm == tmp);
		for (int i = 0; i + 2 < n; i++) {
			bad += (gcd(ans[i], ans[i + 1]) == 1 && 
							gcd(ans[i + 1], ans[i + 2]) == 1 &&
							gcd(ans[i], ans[i + 2]) == 1);
		}
		assert(bad <= 6);

		for (int i = 0; i < n; i++) {
			cout << ans[i] << " \n"[i == n - 1];
		}

	}
  
}

// 7
#include "bits/stdc++.h"

using namespace std;

#define ll long long

int main() {
  ios_base::sync_with_stdio(false);
  cin.tie(NULL);

	int t; cin >> t;
	while (t--) {
	
		int n; cin >> n;

		vector<int> p(n);
	
		vector<int> ccs;

		vector<pair<int,int>> e;

		for (int &i : p) {
			cin >> i;

			int cur_lo = i;
			while (ccs.size() && ccs.back() < i) {
				e.push_back({i, ccs.back()});
				cur_lo = min(cur_lo, ccs.back());
				ccs.pop_back();
			}

			ccs.push_back(cur_lo);

		}

		if (ccs.size() == 1) {
			cout << "Yes\n";
			for (auto [x, y] : e)
				cout << x << " " << y << "\n";
		}
		else {
			cout << "No\n";
		}

	}
  
}

