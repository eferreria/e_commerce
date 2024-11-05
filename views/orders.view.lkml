view: orders {
  sql_table_name: `looker-private-demo.thelook.orders`
    ;;
  drill_fields: [order_id]

  dimension: order_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: report_flag {
    type: yesno
    sql: ${created_raw} is not null ;;
  }

  dimension: report_flag_2 {
    hidden: yes
    type: number
    sql:
    case
    when ${created_raw} is not null
    then 1
    else
    0
    end
    ;;
  }

  measure: sum_flag {
    type: sum
    sql: ${report_flag_2} ;;
  }

  measure: filtered_measure {
    type: count
    filters: [ gender: "M" ]
  }

  measure: pct_report {
    type: number
    sql: ${filtered_measure}/${sum_flag} ;;
    value_format_name: percent_1
  }

  dimension_group: delivered {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.delivered_at ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: num_of_item {
    type: number
    sql: ${TABLE}.num_of_item ;;
  }

  dimension_group: returned {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.returned_at ;;
  }

  dimension_group: shipped {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.shipped_at ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    label: "Order Count"
    description: "Count of Order ID"
    type: count
    drill_fields: [order_id, users.last_name, users.id, users.first_name, order_items.count]
  }
}
