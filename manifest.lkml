# project_name: "thelook_dev"

# # Use local_dependency: To enable referencing of another project
# # on this instance with include: statements
#
# local_dependency: {
#   project: "name_of_other_project"
# }

constant: connection {
  export: override_required
  value: "ef-bq"
}

visualization: {
  id: "new-custom-viz"
  label: "AAA Custom Viz"
  file: "visualizations/new-custom-viz.js"
  dependencies: ["https://d3js.org/d3.v3.min.js"]

}

visualization: {
  id: "tree-org"
  label: "Custom Tree Org"
  file: "visualizations/tree_org.js"
  dependencies: ["https://d3js.org/d3.v3.min.js"]
}

visualization: {
  id: "c-sample"
  label: "Custom Viz Sample"
  # url: "https://localhost:8080/index.js"
  file: "visualizations/looker_hello_world_viz_min.js"
}

visualization: {
  label: "Another Custom Tree"
  id: "another_custom_tree"
  file: "visualizations/custom_collapsible_tree.js"
}

visualization: {
  id: "c-tree"
  label: "Eric's Tree"
  # file: "visualizations/collapsible-tree.js"
  file: "visualizations/cleaned_collapsible_tree.js"
}

visualization: {
  id: "helloworld"
  label: "Hello World"
  file: "visualizations/hello-world.js"
}

constant: db_1_url {
  value: "/dashboards-next/779"
}

constant: db_2_url {
  value: "/dashboards-next/780"
}

constant: env {
  value: "{{_user_attributes['env']}}"
}

constant: bq_project_name {
  value: "looker-private-@{env}"
}


constant: region_selector{
  value: "Region+Selector"
}

constant: patient_region_selector{
  value: "Patient+Region+Selector"
}

constant: selected_region {
  value: "Selected+Region"
}

constant: primary_blue {
  value: "#003963"
}

constant: secondary_blue {
  value: "#008DD1"
}
