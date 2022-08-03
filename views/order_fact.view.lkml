view: order_fact {
  fields_hidden_by_default: yes
    derived_table: {
      explore_source: order_items {
        column: order_id {}
        column: total_revenue {}
        column: avg_total_sales {}
      }
    }
    dimension: order_id {
      hidden: yes
      type: number
    }
    dimension: total_revenue {
      label: "Total Order Sales"
      type: number
      value_format_name: usd
    }
    dimension: avg_total_sales {
      hidden: yes
      type: number
      value_format_name: usd
    }
    measure: avg_dist_total_sales {
      label: "Average Distinct Total Order Sales"
      type: average_distinct
      sql: ${total_revenue} ;;
      sql_distinct_key: ${order_id} ;;
      value_format_name: usd
    }

    measure: median_dist_total_sales {
      label: "Median Distinct Total Order Sales"
      type: median_distinct
      sql: ${total_revenue} ;;
      sql_distinct_key: ${order_id} ;;
      value_format_name: usd
    }

    parameter: choose_measure {
      type: string
      allowed_value: { value: "Average Distinct" }
      allowed_value: { value: "Median Distinct" }
    }

    measure: dynamic_measure {
      type: number
      sql:
      {% if choose_measure._parameter_value == "'Average Distinct'"  %} ${avg_dist_total_sales}
      {% else %} ${median_dist_total_sales}
      {% endif %}
      ;;
      value_format_name: usd
    }

  }
