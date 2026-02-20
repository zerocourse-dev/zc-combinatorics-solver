# Combinatorics Problem Solver

A ZeroCourse project for Course 1.1: Discrete Mathematics (Week 6).

## What You'll Build

Implement a `Combinatorics` class with these methods:

| Method | Description |
|--------|-------------|
| `factorial(n)` | Compute n! |
| `permutations(n, r)` | P(n, r) — ordered arrangements |
| `combinations(n, r)` | C(n, r) — unordered selections |
| `combinations_with_repetition(n, r)` | Selections with repetition allowed |
| `derangements(n)` | D(n) — permutations with no fixed points |
| `stirling_second(n, k)` | Partition n elements into k non-empty subsets |
| `catalan(n)` | The nth Catalan number |
| `pigeonhole_min_items(items, containers)` | Pigeonhole principle |

## Getting Started

1. Install dependencies: `bundle install`
2. Run the tests (they will all fail initially): `bundle exec rspec`
3. Open `lib/combinatorics.rb` and implement each method.
4. Run tests again to check your progress.

## Tips

- Start with `factorial` — several other methods use it.
- `derangements` uses a recurrence: D(n) = (n-1)(D(n-1) + D(n-2)).
- `stirling_second` also uses a recurrence: S(n,k) = k*S(n-1,k) + S(n-1,k-1).
- `catalan` can be computed as C(2n,n)/(n+1) using your `combinations` method.
