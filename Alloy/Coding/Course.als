module Course

sig Mod {
    pre: set Mod 
}

sig Student {
    courses: some Mod
}

fact PreIsNotSelf {
   all m:Mod | all p:Mod | p in m.^pre => p != m && !(m in p.^pre)
}

fact TakePreFirst {
   all m:Mod | all s:Student | m in s.courses => m.pre in s.courses
}

run {}
