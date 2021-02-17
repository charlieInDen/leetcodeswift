class reachingPointsSolution {
    func reachingPoints(_ sx: Int, _ sy: Int, _ tx: Int, _ ty: Int) -> Bool {
        if tx < ty {
            return recurse(sx, sy, tx, ty)
        } else {
            return recurse(sy, sx, ty, tx)
        }
    }
}

func recurse(_ sx: Int, _ sy: Int, _ tx: Int, _ ty: Int) -> Bool {
    if tx < sx {
        return false
    } else if tx == sx {
        if ty >= sy {
            return (ty-sy) % tx == 0
        } else {
            return false
        }
    } else {
        return recurse(sy, sx, ty % tx, tx)
    }
}
