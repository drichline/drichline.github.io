---
title: "Revisiting the \"Pi Business Card\""
date: "2023-02-28"
---

My math/programming skills have improved considerably since my [last post](/pages/picard) on the topic, so I sat down and rewrote it in [Julia](https://julialang.org/) (current favorite language). *TL;DR*: integrating \\\(\int^1_0 4\sqrt{1-x^2}dx\\\) is a really intuitive way to calculate the value of pi. I did it previously in Python using an awful (and certainly not "badass") Riemann Sum that took hours to run. 

I recently wrote a Simpson's 3/8 Rule approximation in MATLAB for an Aerospace Computational Techniques class, which only took a few minutes to translate into Julia's very similar syntax:

{{< highlight julia >}}
using Printf

function simpson38(f::Function,a,b,n)
    h = (b-a)/n
    x_i = a+h;
    x_j = a+2h;
    x_k = a+3h;
    I = 3h*(f(a)+f(b))/8
    for ctr = -1:3:n-2
        I = I+9h*f(x_i)/8
        x_i=x_i+3h
    end
    for ctr = 2:3:n-1
        I = I+9h*f(x_j)/8
        x_j=x_j+3h
    end
    for ctr = 3:3:n-3
        I = I+6h*f(x_k)/8
        x_k=x_k+3h
    end
    return I
end

f(x) = 4sqrt(1-x^2)
n=3

@time while true
    I = simpson38(f,0,1,n)
    E = abs(pi-I)
    if E < 1e-10 
        break
    end
    global n = 3n
end

@printf "Segments: %i\tError: %.1e" n pi-simpson38(f,0,1,n)
{{< /highlight >}}

Output:

{{< highlight text>}}
  0.038539 seconds (98.65 k allocations: 5.290 MiB, 62.54% compilation time)
Segments: 4782969       Error: -2.8e-11
{{< /highlight >}}

Unfortunately, somewhere above \\\(n=10^8\\\) f(x) seems to take the square root of a negative number and throws a complex domain error. 