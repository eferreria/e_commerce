connection: "@{connection}"

# include all the views
include: "/views/**/*.view"
include: "/dashboards/*.dashboard"

datagroup: thelook_dev_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

label: "Development Look"

persist_with: thelook_dev_default_datagroup

explore: products {
  join: distribution_centers {
    type: left_outer
    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one
  }
}

explore: distribution_centers {}

explore: inventory_items {
  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: distribution_centers {
    type: left_outer
    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one
  }
}

explore: order_items {
  hidden: yes
  join: users {
    type: left_outer
    sql_on: ${order_items.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  # join: state_summary {
  #   type: left_outer
  #   sql_on: ${users.state} = ${state_summary.state} ;;
  #   relationship: many_to_one
  # }

  join: order_fact {
    view_label: "Order Items"
    type: left_outer
    sql_on: ${order_fact.order_id} = ${order_items.order_id} ;;
    relationship: many_to_one
  }

  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.order_id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: distribution_centers {
    type: left_outer
    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one
  }
}

explore: events {
  join: users {
    type: left_outer
    sql_on: ${events.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: orders {
    query: status {
        label: "Total Orders by Status"
        dimensions: [status]
        filters: [orders.created_date: "last 7 days"]
        measures: [count]
    }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: users {

  # join: sample_data {
  #   type: inner
  #   relationship: one_to_one
  #   sql_on: ${sample_data.id} = ${users.id} ;;
  # }
}

explore: custom_map {
  from: users
  fields: [custom_map.region_selector, custom_map.city, custom_map.state,
    custom_map.region_selector_filter, custom_map.zip, custom_map.region_selector_color,
    custom_map.market_region, custom_map.county, custom_map.county_fips, custom_map.exposed_fields*
    , hospital_locations.all_hosp_loc*, dashboard_links.current_dashboard, dashboard_links.rendered_nav_guide
  ]

  join: hospital_locations {
    sql_on:  ${custom_map.zip} = ${hospital_locations.zip};;
    relationship: many_to_one
  }

  join: dashboard_links {
    type: left_outer
    relationship: one_to_one
    sql:  ;;
}
}

# # Place in `thelook_dev` model
# explore: +orders {
#   aggregate_table: rollup__status {
#     query: {
#       dimensions: [status]
#       measures: [count]
#       timezone: "America/Los_Angeles"
#     }

#     materialization: {
#       datagroup_trigger: thelook_dev_default_datagroup
#     }
#   }
# }
