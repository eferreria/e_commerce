connection: "@{connection}"

# include all the views
include: "/views/**/*.view"
include: "/dashboards/*.dashboard"
include: "/data_tests/revenue_tests.lkml"
include: "/refinements/*.*"
include: "/explores/order_items.explore"

datagroup: thelook_dev_default_datagroup {
  max_cache_age: "1 hour"
}

datagroup: agg_tables_datagroup {
  sql_trigger: SELECT current_date;;
  max_cache_age: "24 hour"
}


label: "Development Look"

persist_with: thelook_dev_default_datagroup

week_start_day: tuesday

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



explore: events {
  join: users {
    type: left_outer
    sql_on: ${events.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: orders {
  hidden: yes
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
explore: +order_items {
  # aggregate_table: rollup__created_date {
  #   query: {
  #     dimensions: [created_date, calendar_dim.calendar_date]
  #     measures: [total_revenue]

  #   }

  #   materialization: {
  #     datagroup_trigger: agg_tables_datagroup
  #   }
  # }
}
