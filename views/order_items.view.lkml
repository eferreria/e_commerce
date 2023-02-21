view: order_items {
  # sql_table_name: `@{bq_project_name}.thelook.order_items`;;
  sql_table_name:  `looker-private-demo.thelook.order_items`;;
  drill_fields: [id]

  dimension: id {
    label: "Order Items ID"
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      month_name,
      quarter,
      year,
      hour_of_day,
      day_of_year,
      day_of_month,
      day_of_week,
      month_num,
      day_of_week_index
    ]
    sql: ${TABLE}.created_at ;;
  }

  parameter: abstract_value {
    type: date

  }

  dimension_group: delivered {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.delivered_at ;;
  }

  parameter: date_source {
    type: unquoted
    allowed_value: { value: "created_at"}
    allowed_value: { value: "delivered_at"}
  }

  dimension_group: selected {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    sql:
    ${TABLE}.{{date_source._parameter_value}}
    ;;
  }

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
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

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }

  dimension_group: shipped {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
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

  parameter: select_time {
    type: string
    allowed_value: { value: "By Day" }
    allowed_value: { value: "By Week Start" }
    allowed_value: { value: "By Month" }
  }

  dimension: dynamic_time {
    label_from_parameter: select_time
    sql:
    {% if select_time._parameter_value == "'By Day'" %} ${created_date}
    {% elsif select_time._parameter_value == "'By Week Start'" %} ${created_week}
    {% else %} ${created_month}
    {% endif %}
    ;;
  }



  # =================================== Measures =================================== {

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: total_orders {
    type: count_distinct
    sql: ${order_id} ;;
  }

  measure: total_revenue {
    type: sum
    sql: ${sale_price} ;;
    value_format_name: usd
  }

  measure: min_order_revenue {
    type: min
    sql: ${sale_price} ;;
    value_format_name: usd
  }

  measure: max_order_revenue {
    type: max
    sql: ${sale_price} ;;
    value_format_name: usd
  }

  measure: avg_total_sales {
    type: average
    sql: ${sale_price} ;;
    value_format_name: usd
  }

  measure: total_days_in_range {
    type: count_distinct
    sql: ${created_date} ;;
  }

  measure: first_day_in_range {
    type: date
    sql: min(${created_date}) ;;
  }

  measure: last_day_in_range {
    type: date
    sql: max(${created_date}) ;;
  }

# =================================== End Measures =================================== }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      users.last_name,
      users.id,
      users.first_name,
      inventory_items.id,
      inventory_items.product_name,
      orders.order_id
    ]
  }
}


# If necessary, uncomment the line below to include explore_source.
# include: "thelook_dev.model.lkml"

view: order_items_by_state {
  derived_table: {
    explore_source: order_items {
      column: total_orders {}
      column: state { field: users.state }
    }
  }
  dimension: total_orders {

    hidden: yes
    type: number
  }
  dimension: state {
    primary_key: yes
    hidden: yes
  }
  measure: total_orders_by_state {
    type: sum
    sql: ${total_orders} ;;
  }

  set: report_1_fields {
    fields: ["order_items.total_revenue",
      "order_items.total_orders",
      "products.category"]
  }

}


view: order_items_inc {
  derived_table: {
    sql:
    select * from `looker-private-demo.thelook.order_items`
    where {% incrementcondition %} created_at {% endincrementcondition %}
    ;;
    increment_key: "created_date"
    increment_offset: 1
    datagroup_trigger: agg_tables_datagroup
  }
  extends: [order_items]
}

explore: order_items_inc {}
