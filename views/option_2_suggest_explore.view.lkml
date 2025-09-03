explore: option_2_suggest_explore {}
view: option_2_suggest_explore {
    derived_table: {
      explore_source: order_items {
        column: state { field: users.state }
        filters: {
          field: users.state
          value: "-Alabama,-Alaska"
        }
      }
    }
    dimension: state {}
  }
