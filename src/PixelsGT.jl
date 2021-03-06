# PixelsGT.jl

# External packages
using HypergeometricFunctions

# Construct the n-basis eigenfunction of the Kravchuk oscillator
# Kpoly(n,q,j) gives the Kravchuk symmetric polynomial of energy level n,
# between the discrete positions -j <= q <= j

function kravpol(n::Integer, q::Integer, j::Integer)
    # There's a problem in the _₂F₁ who have a NaN value when n = q = N,
    # the bottom right corner of the array
    N = 2 * j
    if n == q == N
        return 0
    else
        return HypergeometricFunctions._₂F₁general2(-n, -q, -N, 2.0)
    end
end

A(n, j) = ((-1)^n / 2^j)
B(n, j) = binomial(2 * j, n)

kravfunc(n,q,j) = A(n, j) * sqrt(B(n, j) * B(j + q, j)) * kravpol(n, j + q, j)

# Construct the Kravchuk matrix of (N+1) x (N+1) dimensions who columns are
# energy levels n, and rows are position index q

# kravmat(j::Integer) = reshape(
#                        [kravfunc(l, m, j) for m in -j:j
#                                            for l in 0:2 * j],
#                                                (2 * j + 1, 2 * j + 1))

function kravmat(j::Integer)
	kvec = zeros(Float64, (2 * j + 1, 2 * j + 1))
	for l in -j:j
		for m in 0:2 * j
			kvec[m + 1, l + 1 + j] = kravfunc(m, l, j)
		end
	end
	return kvec
end
