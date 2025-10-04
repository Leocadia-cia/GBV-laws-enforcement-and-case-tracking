// main.dart
void main() {
  // Create storage lists
  var policies = <Policy>[];
  var cases = <GBVCase>[];

  // Add some data
  addPolicy(policies, "Anti-FGM Act", "Kenya", true);
  addPolicy(policies, "Anti-GBV Law", "Uganda", false);

  addCase(cases, "Case #001", "Kenya", "Pending");
  addCase(cases, "Case #002", "Uganda", "Enforced");

  // Print stored info
  print("\n--- Policies ---");
  printAllPolicies(policies);

  print("\n--- GBV Cases ---");
  printAllCases(cases);

  // Search example
  print("\nSearch policy in Kenya:");
  searchPolicyByCountry(policies, "Kenya");

  // Progress check
  print("\nCase Progress:");
  printCaseProgress(cases);
}

// ---------- FUNCTIONS ----------

// Add new policy
void addPolicy(List<Policy> list, String title, String country, bool enforced) {
  list.add(Policy(title, country, enforced));
}

// Add new GBV Case
void addCase(List<GBVCase> list, String name, String country, String status) {
  list.add(GBVCase(name, country, status));
}

// Print all policies
void printAllPolicies(List<Policy> list) {
  for (var p in list) {
    print(p);
  }
}

// Print all cases
void printAllCases(List<GBVCase> list) {
  for (var c in list) {
    print(c);
  }
}

// Search policies by country
void searchPolicyByCountry(List<Policy> list, String country) {
  for (var p in list) {
    if (p.country == country) {
      print(p);
    }
  }
}

// Track case progress
void printCaseProgress(List<GBVCase> cases) {
  int enforced = cases.where((c) => c.status == "Enforced").length;
  int pending = cases.where((c) => c.status == "Pending").length;

  print("Enforced cases: $enforced");
  print("Pending cases: $pending");
}

// ---------- CLASSES ----------

class Policy {
  String title;
  String country;
  bool enforced;

  Policy(this.title, this.country, this.enforced);

  @override
  String toString() {
    return "$title in $country → Enforced: $enforced";
  }
}

class GBVCase {
  String caseName;
  String country;
  String status;

  GBVCase(this.caseName, this.country, this.status);

  @override
  String toString() {
    return "$caseName in $country → Status: $status";
  }
}

}