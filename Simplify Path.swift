class Solution {
    func simplifyPath(_ path: String) -> String {
        if path.isEmpty { return path }
        let canonicalPath = path.split(separator: "/").reduce(into: [String]()) {
            switch $1 {
                case ".": break
                case "..": if !$0.isEmpty { $0.removeLast() }
                default: $0.append(String($1))
            }
        }
        return canonicalPath.isEmpty ? "/" : canonicalPath.reduce(into: String(), { $0.append("/" + $1) })
    }
}
