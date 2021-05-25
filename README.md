# PixelsGT.jl - A package to unitarily transform pixellated screens

### Goal of the package

Provide a set of methods to evidence the powerfulness of the unitary transformations arising from the symmetries of the compact Lie groups

### Caveats

Just one: **It is incredibily slow!** — Because of the complexity of the algorithm (~ O(N⁴)), this method to compute transformations of 2D images are, unfortunately, the most resources expensive, and truly slow you can find. _This challenge isn't for the impatient_

___
### Usage

At this time (v.0.1.0), there is all set to take a PNG image of N×N pixels, and make a (counterclockwise) rotation given a rotation angle θ.

`Fqθ(θ, q₁, q₂, j, imgdat)` where j is the size of the representation, thus, N = 2j + 1; θ is the rotation angle; (q₁, q₂) ∈ {-j, j} are the indexes of the two-dimensional array; and, imgdat is the two-dimensional array containing the values of the pixels.

```
julia> Fqθ(θ, q₁. q₂, j, imgdat)

julia> "Value of the imgdat pixel (q₁, q₂) when rotated θ"
```

___
Kindly cheers, from the developer, Alejandro R. Urzúa. 😺
