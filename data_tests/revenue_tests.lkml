test: historic_revenue_is_accurate {
  explore_source: order_items {
    column: total_revenue {
      field: order_items.total_revenue
    }
    filters: [order_items.created_date: "2019"]
  }
  assert: revenue_is_expected_value {
    expression: ${order_items.total_revenue} = 1788280.74 ;;
  }
}
