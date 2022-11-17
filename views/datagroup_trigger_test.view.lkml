explore: datagroup_trigger_test {}
view: datagroup_trigger_test {
  derived_table: {
    sql:
    select count(*) as row_count from `@{bq_project_name}.thelook.order_items`;;
    publish_as_db_view: yes
    sql_trigger_value: select extract(hour from current_timestamp()) ;;
    # materialized_view: yes
  }
  dimension: row_count  {}
}

explore: test_order_item {}
view: test_order_item {
  derived_table: {
    sql: select * from ${order_items.SQL_TABLE_NAME} ;;
    datagroup_trigger: datagroup_trigger_test_datagroup
  }

  dimension: order_id {}
}
