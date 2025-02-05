x = 1.1
a = 2.2
b = 3.3


# 1a
z <- (x^a^b)

print(z)
# value = 3.61714

# 1b
z <- ((x^a)^b)
print(z)
# value = 1.997611

# 1c
z <- (3*x^3+2*x^2+1)
print(z)
# value = 7.413


# 2a
seq <- c(seq(1,8), seq(7,1))
print (seq)
# value = 1 2 3 4 5 6 7 8 7 6 5 4 3 2 1

# 2b
rep <- c(rep(1,1), rep(2,2), rep(3,3), rep(4,4), rep(5,5))
print(rep)
# value = 1 2 2 3 3 3 4 4 4 4 5 5 5 5 5

# 2c
rep <- c(rep(5,1), rep(4,2), rep(3,3), rep(2,4), rep(1,5))
print(rep)
# value = 5 4 4 3 3 3 2 2 2 2 1 1 1 1 1


# 3
runif(2)
x <-  0.9920278
y <-  0.5059488

r <- sqrt(x^2+y^2)

theta <- atan2(y, x)

c(r,theta)
# values (1.1135993 0.4716273)


# 4
vector <- queue <- c("sheep", "fox", "owl", "ant")

# 4a
queue <- c("sheep", "fox", "owl", "ant", "serpent")
print(queue)
# value: "sheep"   "fox"     "owl"     "ant"     "serpent"

# 4b
queue <- queue [-c(1)]
print(queue)
# value: "fox"     "owl"     "ant"     "serpent"

# 4c
queue <- c("donkey", "fox", "owl", "ant", "serpent")
print(queue)
# value: "donkey"  "fox"     "owl"     "ant"     "serpent"

# 4d
queue <- queue [-c(5)]
print(queue)
# value: "donkey" "fox"    "owl"    "ant"

# 4e
queue <- queue [-c(3)]
print(queue)
#value: "donkey" "fox"    "ant"

# 4f
queue <- c("donkey", "fox", "aphid", "ant")
print(queue)
# value: "donkey" "fox"    "aphid"  "ant"

# 4g
queue <- queue [c(3)]
print(queue)
# value: "aphid"


# 5
integers <- 1:100
print(integers)
integers_new <- integers[!(integers %% 2==0| integers %% 3==0| integers %% 7==0)]
print(integers_new)
# value: 1  5 11 13 17 19 23 25 29 31 37 41 43 47 53 55 59 61 65 67 71 73 79 83 85 89 95 97




