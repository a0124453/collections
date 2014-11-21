sig Platform{}
sig Man{ceiling,floor:Platform}
pred Above[m,n:Man] {m.floor=n.ceiling}
fact {all m: Man | some n: Man | Above[n,m]}
assert BelowToo {
all m: Man | some n: Man | Above [m,n]
}
check BelowToo for 2
