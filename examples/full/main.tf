module "assert-boolean" {
  source    = "github.com/CodyKochmann/tf-assert"
  condition = 1 != 2
  message   = "this really should have worked"
}

module "assert-equality" {
  source   = "github.com/CodyKochmann/tf-assert/eq"
  expected = 1
  actual   = 1
}

module "assert-equality-strings" {
  source   = "github.com/CodyKochmann/tf-assert/eq"
  expected = "hello world"
  actual   = "hello world"
}

module "assert-unequality" {
  source   = "github.com/CodyKochmann/tf-assert/neq"
  unexpected = "hello world"
  actual     = "hello"
}

module "assert-greater-or-equal" {
  source   = "github.com/CodyKochmann/tf-assert/ge"
  expected = 0
  actual   = 2
}

module "assert-strict-greater" {
  source   = "github.com/CodyKochmann/tf-assert/gt"
  expected = 0
  actual   = 1
}

module "assert-less-or-equal" {
  source   = "github.com/CodyKochmann/tf-assert/le"
  expected = 2
  actual   = 0
}

module "assert-strict-less" {
  source   = "github.com/CodyKochmann/tf-assert/lt"
  expected = 1
  actual   = 0
}

module "assert-match-regex" {
  source   = "github.com/CodyKochmann/tf-assert/match"
  regex  = "[a-z]*"
  actual = "rego"
}
