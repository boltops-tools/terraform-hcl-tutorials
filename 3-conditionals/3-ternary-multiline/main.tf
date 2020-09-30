output "c1" {
  value = contains(["a","b","c"], "d") ? "is true" : "is false"
}
output "c2" {
  value = (
            contains(["a","b","c"], "d")
              ? "is true"
              : "is false"
          )
}
# Is an syntax error without the parenthesis
# output "c3" {
#   value = contains(["a","b","c"], "d")
#             ? "is true"
#             : "is false"
# }
