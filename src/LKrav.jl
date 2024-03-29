"This script computes the Laguerre-Kravchuk functions, who are the Kravchuk functions on a angular momentum space."

using PixelsGT # Call the parent module

export  ϕd, ϕu, LKd, LKu, LK

"`Φd(q₁, q₂, n, m, j)` rotates π/2 the Kravchuk function modes at (n, |m| ≤ n) for n ∈ [0, 2j]. It needs to be evaluted at (q₁, q₂) ∈ [0, 2j + 1]."
function Φd(q₁, q₂, n, m, j)
    v₀ = zeros(Integer(2 * j + 1)) # (Sep 9, 2021) Added Integer() to meet the half-spin feature in j
    for n₁ in 0:n
        v₀[Integer(n₁ + 1)] = Φ2(n₁, n - n₁, q₁, q₂, j) * dd(n, j)[n₁ + 1, Integer((m + n)/2) + 1]
    end
    return sum(v₀)
end

"`Φu(q₁, q₂, n, m, j)` rotates π/2 the Kravchuk function modes at (n, |m| ≤ 4j - n) for n ∈ [4j, 2j]. It needs to be evaluted at (q₁, q₂) ∈ [0, 2j + 1]."
function Φu(q₁, q₂, n, m, j)
    v₁ = zeros(Integer(2 * j + 1))
    for n₁ in 0:Integer((4* j - n))
        v₁[n₁ + 1] = Φ2(2 * j - n₁, n + n₁ - 2 * j, q₁, q₂, j) * du(n, j)[n₁ + 1, Integer((m + 4 * j - n)/2) + 1]
    end
    return sum(v₁)
end

"Laguerre-Kravchuk modes functions are the core of the rotation of images, they encodes the original position information in a mode-angular momentum space, ready to apply an angle phase who rotates the image"

"`LKd(q₁, q₂, n, m, j)` gives Laguerre-Kravchuk modes at (n, |m| ≤ n) for n ∈ [0, 2j]. It needs to be evaluted at (q₁, q₂) ∈ [0, 2j + 1]."
function LKd(q₁, q₂, n, m, j)
    vlkd = zeros(ComplexF64, Integer(2 * j + 1))
    for n₁ in 0:n
        vlkd[n₁ + 1] = (-1.0im)^(n - n₁) * Φ2(n₁, n - n₁, q₁, q₂, j) * dd(n, j)[n₁ + 1, Integer((m + n)/2) + 1]
    end
    return (-1.0)^((0.5) * (abs(m) - m)) * sum(vlkd)
end

"`LKu(q₁, q₂, n, m, j)` gives the Laguerre-Kravchuk modes at (n, |m| ≤ 4j - n) for n ∈ [4j, 2j]. It needs to be evaluted at (q₁, q₂) ∈ [0, 2j + 1]."
function LKu(q₁, q₂, n, m, j)
    vlku = zeros(ComplexF64, Integer(2 * j + 1))
    for n₁ in 0:Integer(4* j - n)
        vlku[n₁ + 1] = (-1.0im)^(n - n₁) * Φ2(2 * j - n₁, n + n₁ - 2 * j, q₁, q₂, j) * du(n, j)[n₁ + 1, Integer((m + 4 * j - n)/2) + 1]
    end
    return (-1.0)^((0.5) * (abs(m) - m)) * sum(vlku)
end

"`LK(q₁, q₂, n, m, j)` gives the complete Laguerre-Kravchuk modes. Their index ranges are n ∈ [0, 4j] and m ∈ [-n,n] in steps of 2."
function LK(q₁, q₂, n, m, j)
    if 0 ≤ n ≤ 2 * j
        return LKd(q₁, q₂, n, m, j)
    elseif 2 * j < n ≤ 4 * j
        return LKu(q₁, q₂, n, m, j)
    end
end
