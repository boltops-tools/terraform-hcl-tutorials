output "b1" {
  value = contains(["a","b","c"], "d") ? "is true" : "is false"
}
output "b2" {
  value = keys({a: 1, b: 2, c: 3}) == ["a","b","c"] ? "is true" : "is false"
}
output "b3" {
  value = contains(keys({a: 1, b: 2, c: 3}), "b") ? "is true" : "is false"
}
