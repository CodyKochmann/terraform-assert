# this provides an output value for other modules to "depend on"
# to get this functionality add any of the following to any resource
# that needs to be blocked by your assertion's failure.
#
#   depends_on = [module.test_name]
#   depends_on = [module.test_name.ok]
#   depends_on = [module.test_name.result]
#   depends_on = [module.test_name.success]
#

output "ok" {
  value = true
}

output "result" {
  value = true
}

output "success" {
  value = true
}

# Note: all of these outputs will always be available
# to preserve compatability :)

