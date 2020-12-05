module "assert-boolean" {
  source    = "github.com/CodyKochmann/terraform-null-assert"
  condition = 1 != 2
  message   = "this really should have worked"
}

module "assert-equality" {
  source   = "git::https://github.com/CodyKochmann/terraform-null-assert.git//modules/eq"
  expected = 1
  actual   = 1
}

module "assert-equality-strings" {
  source   = "git::https://github.com/CodyKochmann/terraform-null-assert.git//modules/eq"
  expected = "hello world"
  actual   = "hello world"
}

module "assert-unequality" {
  source   = "git::https://github.com/CodyKochmann/terraform-null-assert.git//modules/neq"
  unexpected = "hello world"
  actual     = "hello"
}

module "assert-greater-or-equal" {
  source   = "git::https://github.com/CodyKochmann/terraform-null-assert.git//modules/ge"
  expected = 0
  actual   = 2
}

module "assert-strict-greater" {
  source   = "git::https://github.com/CodyKochmann/terraform-null-assert.git//modules/gt"
  expected = 0
  actual   = 1
}

module "assert-less-or-equal" {
  source   = "git::https://github.com/CodyKochmann/terraform-null-assert.git//modules/le"
  expected = 2
  actual   = 0
}

module "assert-strict-less" {
  source   = "git::https://github.com/CodyKochmann/terraform-null-assert.git//modules/lt"
  expected = 1
  actual   = 0
}

module "assert-match-regex" {
  source   = "git::https://github.com/CodyKochmann/terraform-null-assert.git//modules/match"
  regex  = "[a-z]*"
  actual = "rego"
}
