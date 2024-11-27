export insort_left, insort_right, insort

"""
    insort_left(a, x, lo = 1, hi = nothing)

Insert item `x` in array `a`, and keep it sorted assuming `a` is sorted.

If `x` is already in `a`, insert it to the left of the leftmost `x`.

Optional args `lo` (default `1`) and `hi` (default `length(a)`) bound the
slice of `a` to be searched.

A custom `key` function can be supplied to customize the sort order.
"""
function insort_left(a, x, lo = 1, hi = nothing; key = nothing)
    if key === nothing
        lo = bisect_left(a, x, lo, hi)
    else
        lo = bisect_left(a, key(x), lo, hi, key = key)
    end
    return insert!(a, lo, x)
end

"""
    insort_right(a, x, lo = 1, hi = nothing)

Insert item `x` in array `a`, and keep it sorted assuming `a` is sorted.

If `x` is already in `a`, insert it to the right of the rightmost `x`.
Optional args `lo` (default `1`) and `hi` (default `length(a)`) bound the
slice of `a` to be searched.
"""
function insort_right(a, x, lo = 1, hi = nothing)
    lo = bisect_right(a, x, lo, hi)
    return insert!(a, lo, x)
end

const insort = insort_right
