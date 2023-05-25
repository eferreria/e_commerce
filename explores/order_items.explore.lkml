include: "/views/*.view"
# Place in `thelook_dev` model
explore: +order_items {
  aggregate_table: rollup__products_category {
    query: {
      dimensions: [products.category, inventory_items.created_date]
      measures: [total_orders, total_revenue]
    }

    materialization: {
      datagroup_trigger: agg_tables_datagroup
    }
  }
}



explore: order_items {
  # hidden: yes

  # Option 1
  # sql_always_where: ${users.state} not in ('Alabama', 'Alaska') ;;

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

  join: order_items_by_state {
    sql_on: ${order_items_by_state.state} = ${users.state} ;;
    relationship: many_to_one
  }
}
