# project_name: "thelook_dev"

# # Use local_dependency: To enable referencing of another project
# # on this instance with include: statements
#
# local_dependency: {
#   project: "name_of_other_project"
# }
visualization: {
  id: "c-tree"
  label: "Eric's Tree"
  file: "visualizations/collapsible-tree.js"
}


visualization: {
  id: "column-chart"
  label: "Eric's Column"
  file: "visualizations/column.js"
  dependencies: [
    "https://code.jquery.com/jquery-2.2.4.min.js",
    "https://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.9.1/underscore-min.js",
    "https://cdnjs.cloudflare.com/ajax/libs/d3/4.13.0/d3.js"]
}

visualization: {
  id: "helloworld"
  label: "Hello World"
  file: "visualizations/hello-world.js"
}
