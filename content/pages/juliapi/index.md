---
title: "Revisiting the \"Pi Business Card\""
date: "2023-02-28"
lastmod: "2024-07-17"
---

My math/programming skills have improved considerably since my [last post](/pages/picard) on the topic, so I sat down and rewrote it in [Julia](https://julialang.org/) (current favorite language). *TL;DR*: integrating \\\(\int^1_0 4\sqrt{1-x^2}dx\\\) is a really intuitive way to calculate the value of pi. I did it previously in Python using an awful (and certainly not "badass") Riemann Sum that took hours to run. 

I recently wrote a Simpson's 3/8 Rule approximation in MATLAB for an Aerospace Computational Techniques class, which only took a few minutes to translate into Julia's very similar syntax:

{{< highlight julia >}}
using Printf

function simpson38(f::Function, a, b, n)
    h = (b - a) / n
    x_i = a + h
    x_j = a + 2h
    x_k = a + 3h
    I = 3h * (f(a) + f(b)) / 8
    for ctr = -1:3:n-2
        I = I + 9h * f(x_i) / 8
        x_i = x_i + 3h
    end
    for ctr = 2:3:n-1
        I = I + 9h * f(x_j) / 8
        x_j = x_j + 3h
    end
    for ctr = 3:3:n-3
        I = I + 6h * f(x_k) / 8
        x_k = x_k + 3h
    end
    return I
end

f(x) = 4sqrt(abs(1 - x^2))
n = 3

if length(ARGS) !=1
	err = "1e-10"
else
	err = (parse(Float64, ARGS[1]))
end

while true
    global I::Float64 = simpson38(f, 0, 1, n)
    global E = abs(pi - I)
    if E < err
    	@printf "pi: %1.10f Segments: %i\nError: %.1e" I n E #pi - simpson38(f, 0, 1, n)
        break
    end
    global n = n * log(n)
end

{{< /highlight >}}

Output:

{{< highlight text>}}
pi: 3.1415926537 Segments: 13980175
Error: 1.2e-10
{{< /highlight >}}

Unfortunately, it hangs when err is set below 1e-10 and I can't figure out why