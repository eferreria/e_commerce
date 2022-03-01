view: state_summary {
# If necessary, uncomment the line below to include explore_source.
# include: "thelook_dev.model.lkml"
    derived_table: {
      explore_source: order_items {
        column: state { field: users.state }
        column: total_orders {}
        column: total_revenue {}
        bind_filters: {
          from_field: users.country
          to_field:  users.country
        }
      }
    }
    dimension: state {}

    dimension: total_orders_by_state {
      sql: ${TABLE}.total_orders ;;
      type: number
    }
    dimension: total_revenue_by_state {
      sql: ${TABLE}.total_revenue ;;
      value_format: "$#,##0.00"
      type: number
    }
  }
