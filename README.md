# PixelsGT.jl - A package to transform pixelated screens

#### Alejandro R. Urzúa

____

(v. 0.1.0)

At this begins, the package aims to be a collection of scripts to do unitary, ergo revertible, transformations on 1D and 2D arrays. We call this arrays _pixelated screens_. The scripts here presented are based on a bunch of fundamental research papers about analysis, synthesis and transformations of these pixelated screens.

###### Discrete and finite signals encoding

Given a set of $N+1$ signal points, we want to encode their information in a new basis. This basis is orthonormal and constructed to resemble the harmonic oscillator basis when a suitable sampling is performed [1, 2].

###### Unitary rotation of pixelated monochromatic screens

This kind of transformation is defined as:

> Given a field (matrix) of $(N+1)\times(N+1)$ elements ranging from $0$ to $1$. We seek to implement an unitary rotation who has no information loss. The transformation is based on the implementation of the discrete and finite harmonic oscillator through Kravchuk functions [3, 4].

____

____

###### Bibliography

[1] Atakishiyev, N.M., Pogosyan, G.S., & Wolf, K.B. (2005). Finite models of the oscillator. Fizika Ehlementarnykh Chastits i Atomnogo Yadra, 36(3), 473-508. https://www.fis.unam.mx/~bwolf/Articles/129.pdf

[2] Atakishiyev, N., & Wolf, K. (1993). Approximation on a finite set of points through kravchuk functions. https://rmf.smf.mx/ojs/rmf/article/view/2409/2377

[3] Wolf, K. B., & Alieva, T. (2008). Rotation and gyration of finite
two-dimensional modes. Journal of the Optical Society of America A,
25(2), 365. https://doi.org/10.1364/josaa.25.000365

[4] Urzúa, A. R., & Wolf, K. B. (2016). Unitary rotation and gyration of
 pixelated images on rectangular screens. Journal of the Optical Society
 of America A, 33(4), 642. https://doi.org/10.1364/josaa.33.000642
