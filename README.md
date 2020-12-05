# Introduction

Assert is a terraform assertion utility. As far you may know currently there is no any invariant processing support in Terraform itself or anywhere in its community modules. This library was introduced to fullfill this space. Moreover: this library may be used in your custom modules unit testing.

General programming rule is that each time you assume something you must write down your assumption in code. Otherwise later or earlier you'll get some problems.

# Prerequisites

At the moment Windows OS is not supported. There are no any known terraform limitations within concise versions. Please inform me in case you find some version-specific issues.

# Basic usage

Basic usage is pretty simple: you create check module, you pass condition variable and you get error if it doesn't interpolate to true value. Example presented below ensures that at least one subnet exists in given AWS VPC with vpc_id = "vpc-funnyid".

```terraform
data "aws_subnet_ids" "example" {
  vpc_id = "vpc-funnyid"
}

module "ensure_subnets_are_present" {
    source    = "github.com/CodyKochmann/terraform-assert"
    condition = 0 != length(data.aws_subnet_ids.example.ids)
    message   = "No pre-existing subnets were found in vpc-funnyid"
}
```

# Other Example Usage

```terraform
module "assert-boolean" {
  source    = "github.com/CodyKochmann/terraform-assert"
  condition = 1 != 2
  message   = "this really should have worked"
}

module "assert-equality" {
  source   = "git::https://github.com/CodyKochmann/terraform-assert.git//modules/eq"
  expected = 1
  actual   = 1
}

module "assert-equality-strings" {
  source   = "git::https://github.com/CodyKochmann/terraform-assert.git//modules/eq"
  expected = "hello world"
  actual   = "hello world"
}

module "assert-unequality" {
  source   = "git::https://github.com/CodyKochmann/terraform-assert.git//modules/neq"
  unexpected = "hello world"
  actual     = "hello"
}

module "assert-greater-or-equal" {
  source   = "git::https://github.com/CodyKochmann/terraform-assert.git//modules/ge"
  expected = 0
  actual   = 2
}

module "assert-strict-greater" {
  source   = "git::https://github.com/CodyKochmann/terraform-assert.git//modules/gt"
  expected = 0
  actual   = 1
}

module "assert-less-or-equal" {
  source   = "git::https://github.com/CodyKochmann/terraform-assert.git//modules/le"
  expected = 2
  actual   = 0
}

module "assert-strict-less" {
  source   = "git::https://github.com/CodyKochmann/terraform-assert.git//modules/lt"
  expected = 1
  actual   = 0
}

module "assert-match-regex" {
  source   = "git::https://github.com/CodyKochmann/terraform-assert.git//modules/match"
  regex  = "[a-z]*"
  actual = "rego"
}
```

# Features

As a development of IaaC concept, some common features of assertions in regular programming languages were introduced. Additional supported operators are listed below:
 * `ACTUAL eq EXPECTED`
 * `ACTUAL neq UNEXPECTED`
 * `ACTUAL gt(>) EXPECTED`
 * `ACTUAL ge(>=) EXPECTED`
 * `ACTUAL lt(<) EXPECTED`
 * `ACTUAL le(<=) EXPECTED`
 * `ACTUAL match REGEX`

You may find usage snippets in examples directory.
